FactoryGirl.define do
  factory :league do
    sequence(:name) { |n| "league #{n}" }
    sequence(:slug) { |n| "league-#{n}" }
    user
  end
end
