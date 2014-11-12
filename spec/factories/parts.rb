FactoryGirl.define do
  factory :parts do
    name { Faker::Commerce.color }
  end
end