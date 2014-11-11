FactoryGirl.define do
  factory :area do
    name { Faker::Commerce.department }
    number { Faker::Number.number(5) }
    
    factory :invalid_area do
      name nil
    end
  end
end