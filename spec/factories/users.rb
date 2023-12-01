FactoryBot.define do
  factory :user do
    nickname { 'やまだ' }
    email  {Faker::Internet.email}
    password { 'aaaa11' }
    password_confirmation { 'aaaa11' }
    first_name { '山田' }
    last_name { '太郎' }
    first_kana { 'ヤマダ' }
    last_kana { 'タロウ' }
    birthday { '2000-01-01' }

    trait :invalid_password do
      password { 'invalid_password' }
      password_confirmation { 'invalid_password_confirmation' }
    end
  end
end