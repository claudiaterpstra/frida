class UsersController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_user, only: [:show]
  def show
    @courses = @user.courses_participated
    @artworks = @user.artworks.where(featured: true)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :biodata, :photo)
  end

end
