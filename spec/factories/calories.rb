FactoryBot.define do
  factory :calory do
    calories_intake {1000}
    start_time {2023-0-13 03:00:00}

    association :user
  end
end
