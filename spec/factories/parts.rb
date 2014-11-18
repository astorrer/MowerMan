FactoryGirl.define do
  factory :part do
    name { Faker::Commerce.color }
  end
  
  factory :invalid_part do
    name nil
  end
end