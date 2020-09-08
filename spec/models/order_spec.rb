require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @seller = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/flag.png')
    @buyer = FactoryBot.build(:user)
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        expect(@order).to be_valid
      end
      it '建物名がなくても購入できる' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空では購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ形式でないと購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が選択されていないと購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空では購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれていると購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.phone_number = '090-1111-2222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以上だと購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.phone_number = '090111113333'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが生成されていなければ購入できない' do
        expect(@seller).to be_valid
        expect(@item).to be_valid
        expect(@buyer).to be_valid
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
