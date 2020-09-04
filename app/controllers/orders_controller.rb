class OrdersController < ApplicationController
  
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.find(params[:item_id])
    @order = Order.new
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
    params.require(:order).permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_item_id).merge(params.permit[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end