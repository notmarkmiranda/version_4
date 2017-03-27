FactoryGirl.define do
  factory :participant do
    sequence(:first_name) { |n| "first #{n}" }
    sequence(:last_name) { |n| "last #{n}"}
    user
  end
end
