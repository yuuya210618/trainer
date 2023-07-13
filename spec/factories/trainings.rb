FactoryBot.define do
  factory :training do
    training_name {'あいうえお'}
    weight {50}
    number {100}
    start_time {2023-0-13 03:00:00}

    association :user
  end
end
