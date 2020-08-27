class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id,
                                 :item_condition_id, :shipping_charge_id, :prefecture_id, :preparation_day_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
end
end
