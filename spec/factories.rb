require "faker"

FactoryBot.define do
  factory :quiz_result do
    number_correct { Faker::Number.between(from: 0, to: 20) }
    user { nil }
  end

  factory :user do
    name { Faker::Name.name }
    user_id_token { Faker::Number.number(digits: 10) }
  end
end
