FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    user_id_token { Faker::Number.number(digits: 10) }
  end
end
