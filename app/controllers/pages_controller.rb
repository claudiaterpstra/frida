class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def studentdashboard
  end

  def artistdashboard
  end
end
