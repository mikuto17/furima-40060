require 'rails_helper'

RSpec.describe BoughtsShipping, type: :model do
  
  describe '発送先情報' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @boughts_shipping = FactoryBot.build(:boughts_shipping, user_id: user.id, product_id: product.id)
      sleep 1
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@boughts_shipping).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @boughts_shipping.building_name = ''
        expect(@boughts_shipping).to be_valid
      end

    context '内容に問題がある場合' do
      it 'postalが空では保存できない' do
        @boughts_shipping.postal = ''
        @boughts_shipping.valid?
        expect(@boughts_shipping.errors.full_messages).to include("Postal can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @boughts_shipping.token = nil
        @boughts_shipping.valid?
        expect(@boughts_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '3桁ハイフン4桁の半角文字列でないと保存できない' do
        @boughts_shipping.postal = '1234567'
        @boughts_shipping.valid?
        expect(@boughts_shipping.errors[:postal]).to include('is invalid. Include hyphen(-)')
      end

    it 'prefectuer_idが空では保存できない' do
      @boughts_shipping.prefecture_id = 1
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'cityが空では保存できない' do
      @boughts_shipping.city = ''
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("City can't be blank")
    end

    it 'street_addressが空では保存できない' do
      @boughts_shipping.street_address = ''
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Street address can't be blank")
    end

    it 'phone_numberが空では保存できない' do
      @boughts_shipping.phone_number = ''
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberは9桁以下では保存できない' do
      @boughts_shipping.phone_number = '123456789'
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください。例: 09012345678")
    end

    it 'phone_numberは12桁以上では保存できない' do
      @boughts_shipping.phone_number = '123456789123'
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください。例: 09012345678")
    end

    it 'phone_numberに半角数字以外が含まれていると保存できない' do
      @boughts_shipping.phone_number = '１２３４５６７８９１'
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください。例: 09012345678")
    end

    it 'userが紐付いていないと保存できない' do
      @boughts_shipping.user_id = nil
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'productが紐付いていないと保存できない' do
      @boughts_shipping.product_id = nil
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Product can't be blank")
    end
  end


  end
end
end
