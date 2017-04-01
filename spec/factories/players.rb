FactoryGirl.define do
  factory :player do
    participant
    finishing_place 1
    game
    additional_expense 10
  end
end
