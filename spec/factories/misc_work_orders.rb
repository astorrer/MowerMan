FactoryGirl.define do
  factory :misc_work_order do
    account_number { Faker::Number.number(5) }
    cost_unit { Faker::Commerce.department }
    cost_center { Faker::Commerce.department }
    cost_description { Faker::Lorem.sentence }
    start_date { Faker::Time.between(2.days.ago, Time.now) }
    due_date   { Faker::Time.between(1.days.ago, Time.now) }
    description { Faker::Lorem.paragraph }
    urgency  4
    completion_switch false
    department_id 1

    factory :invalid_misc_work_order do
      name nil
    end
  end
end