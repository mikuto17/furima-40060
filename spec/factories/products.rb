FactoryBot.define do
  factory :product do
    name { '古着' }
    category_id { '2' }
    condition_id { '2' }
    description { 'ストリート系' }
    price { '600' }
    prefecture_id { '2' }
    days_until_id { '2' }
    burden_id { '2' }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
