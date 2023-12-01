FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { Faker::Japanese::Name.first_name }
    last_name { Faker::Japanese::Name.last_name }
    first_kana { Faker::Japanese::Name.first_name }
    last_kana { Faker::Japanese::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }

    trait :invalid_password do
      password { 'invalid_password' }
      password_confirmation { 'invalid_password_confirmation' }
    end
  end
end