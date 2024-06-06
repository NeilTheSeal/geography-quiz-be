require "faker"

FactoryBot.define do
  factory :quiz_result do
    number_correct { Faker::Number.between(from: 0, to: 20) }
    user_id { Faker::Number.between(from: 1_000_000_000, to: 9_999_999_999) }
    created_at {"2024-01-01T00:00:00.000Z"}
  end
end
