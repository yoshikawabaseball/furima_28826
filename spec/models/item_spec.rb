require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/flag.png')
  end

  describe '商品出品情報を入力して保存' do
    context '商品出品情報を保存できる' do
      it 'name, introduction, price, image, category_id, item_condition_id, shipping_charge_id, prefecture_id, preparation_day_id, user_idが存在すれば保存できる ' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報を保存できない' do
      it 'nameが存在しなければ保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'introductionが存在しなければ保存できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'priceが存在しなければ保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが存在しなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが存在しなければ保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'item_condition_idが存在しなければ保存できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition Select")
      end
      it 'shipping_charge_idが存在しなければ保存できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end
      it 'prefecture_idが存在しなければ保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'preparation_day_idが存在しなければ保存できない' do
        @item.preparation_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day Select")
      end
      it "￥300~￥9999999の間でなければ保存できない" do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "catefory_idが1の時、保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "item_conditionidが1の時、保存できない" do
        @item.item_condition_id = '1'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Item condition Select")
      end
      it "shipping_charge_idが1の時、保存できない" do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end
      it "prefecture_idが1の時、保存できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "preparation_day_idが1の時、保存できない" do
        @item.preparation_day_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day Select")
      end
    end
  end
end
