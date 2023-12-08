FactoryBot.define do
  factory :boughts_shipping do
      postal { '111-1111' }
      prefecture_id { '2' }
      city { '川崎市' }
      street_address { '川崎' }
      building_name { '山田' }
      phone_number { '09012345678' }   
  end
end
