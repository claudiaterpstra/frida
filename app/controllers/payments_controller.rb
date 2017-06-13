class PaymentsController < ApplicationController
  before_action :set_order
  skip_after_action :verify_authorized

  def new
    @course = Course.find(@order.course_id)
  end

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_pennies, # or amount_cents
    description:  "Payment for course #{@order.course_id} for order #{@order.id}",
    currency:     @order.amount.currency
  )

  @order.update(payment: charge.to_json, state: 'paid')
  Participation.create!(user_id: current_user.id, course_id: @order.course_id)
  redirect_to order_path(@order)

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)
  end


  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
