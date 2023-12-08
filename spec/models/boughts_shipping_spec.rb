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
    end

    context '内容に問題がある場合' do
      it 'postalが空では保存できない' do
        @boughts_shipping.postal = ''
        @boughts_shipping.valid?
        expect(@boughts_shipping.errors.full_messages).to include("Postal can't be blank")
      end

    it '3桁ハイフン4桁の半角文字列でないと保存できない' do
      boughts_shipping = FactoryBot.build(:boughts_shipping, postal: '1234567')
      boughts_shipping.valid?
      expect(boughts_shipping.errors[:postal]).to include('is invalid. Include hyphen(-)')
    end

    it 'prefectuer_idが空では保存できない' do
      @boughts_shipping.prefecture_id = ''
      @boughts_shipping.valid?
      expect(@boughts_shipping.errors.full_messages).to include("Prefecture can't be blank")
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

    it 'phone_numberは10桁以上11桁以内の半角数値でないと保存できない' do
      @boughts_shipping.phone_number = '09012345678'
      expect(@boughts_shipping).to be_valid
    end

    it 'userが紐付いていないと保存できない' do
      @boughts_shipping.user_id = nil
        @boughts_shipping.valid?
        expect(@boughts_shipping.errors.full_messages).to include()
      end
  end

  end
end
