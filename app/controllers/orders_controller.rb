class OrdersController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
  end
end
