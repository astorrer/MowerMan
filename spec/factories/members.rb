# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    tenant nil
    user nil
    first_name "MyString"
    last_name "MyString"
  end
end
