class BoughtsShipping
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal, :prefecture_id, :city, :street_address, :building_name, :phone_number

  with_options presence: true do
  validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id
  validates :city
  validates :street_address
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の半角数字で入力してください。例: 09012345678' }

  end

  def save
  bought = Bought.create(product_id: product_id, user_id: user_id)
  Shipping.create(postal: postal, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, bought_id: bought.id)
  end

end