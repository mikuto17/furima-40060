require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = FactoryBot.build(:product)
end

context '出品できる場合' do
  it 'すべての項目が存在すれば出品できること' do
    expect(@product).to be_valid
  end
end

context '出品できない場合' do
  it 'imageが空では出品できないこと' do
    @product.image = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Image can't be blank")
  end
  it 'nameが空では出品できないこと' do
    @product.name = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end
  it 'descriptionが空では出品できないこと' do
    @product.description = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Description can't be blank")
  end
  it 'category_idが空では出品できないこと' do
    @product.category_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Category must be other than 1")
  end
  it 'condition_idが空では出品できないこと' do
    @product.condition_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Condition must be other than 1")
  end
  it 'burden_idが空では出品できないこと' do
    @product.burden_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Burden must be other than 1")
  end
  it 'prefecture_idが空では出品できないこと' do
    @product.prefecture_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it 'days_until_idが空では出品できないこと' do
    @product.days_until_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Days until must be other than 1")
  end
  it 'priceが空では出品できないこと' do
    @product.price = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが299円以下だと出品できないこと' do
    @product.price = '299'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
  it 'priceが10000000円以上だと出品できないこと' do
    @product.price = '10000000'
    @product.valid?
    expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
  it 'priceが半角数値でないと出品できないこと' do
    @product.price = '３００'
    @product.valid?
    expect(@product.errors.full_messages).to include('Price is not a number')
  end
  it 'userが紐付いていないと保存できない' do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('User must exist')
  end
 end
end