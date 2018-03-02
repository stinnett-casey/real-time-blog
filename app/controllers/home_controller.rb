class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      render 'users/show'
    end
  end
end
