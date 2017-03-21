FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@email.com"}
    password "password"
  end
end
