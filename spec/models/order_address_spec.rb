require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end
    
    context '商品の購入ができる時' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@order_address).to be_valid
      end
    end 
    
    context 'できない時' do
      it '郵便番号が空では、商品の購入ができない' do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では、商品の購入ができない' do
        @order_address.area_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空では、商品の購入ができない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では、商品の購入ができない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では、商品の購入ができない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が空では、商品の購入ができない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンがないと、商品の購入ができない' do
        @order_address.post_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it '電話番号にはハイフンがあると、商品の購入ができない' do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は11桁以内ででなければ、商品の購入ができない' do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
