class OrdersController < ApplicationController
  
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
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
    params.require(:user_item).permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_17db5bb34aa610d623bdac68"
    Payjp::Charge.create(
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end