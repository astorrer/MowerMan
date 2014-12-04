FactoryGirl.define do
  factory :misc_work_order do
    name { Faker::Commerce.department }
    number { Faker::Number.number(5) }
    
    factory :invalid_misc_work_order do
      name nil
    end
  end
end