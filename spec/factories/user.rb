FactoryGirl.define do
  factory :user do
    email { 'user_name@asamacm.com' }
    password 'secretpassword'
    password_confirmation 'secretpassword'
    confirmed_at Time.now
    department_id 1
    locale 'en'
    
    factory :manager do
      after(:create) {|user| user.add_role(:manager)}
    end
    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end
end