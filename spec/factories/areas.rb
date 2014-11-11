FactoryGirl.define do
  factory :area do
    name { Faker::Commerce.department }
    number { Faker::Number.number(5) }
  end
end