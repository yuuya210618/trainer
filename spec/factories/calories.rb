FactoryBot.define do
  factory :calory do
    calories_intake { 1000 }
    start_time { Time.current }

    association :user
  end
end
