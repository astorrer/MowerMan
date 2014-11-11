FactoryGirl.define do
  factory :equipment do
    name { Faker::Commerce.color }
    number { Faker::Number.number(5) }
  end
end