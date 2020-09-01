class OrdersController < ApplicationController
  
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_17db5bb34aa610d623bdac68"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end