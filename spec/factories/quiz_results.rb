FactoryBot.define do
  factory :quiz_result do
    number_correct { Faker::Number.between(from: 0, to: 20) }
    user { nil }
  end
end
