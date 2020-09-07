class OrdersController < ApplicationController
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.find(params[:item_id])
    @order = Order.new

    redirect_to root_path if @item.user_id

    redirect_to root_path if @item.user_item
  end

  def create
    @item = Item.find(params[:item_id])
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
    # params.require(:order).permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(params.permit[:token])
    params.require(:order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
