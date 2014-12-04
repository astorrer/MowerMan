FactoryGirl.define do
  factory :procedure do
    name { Faker::Commerce.color }
  end
  
  factory :invalid_procedure do
    name nil
  end
end