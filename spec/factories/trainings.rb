FactoryBot.define do
  factory :training do
    training_name { 'あいうえお' }
    weight { 50 }
    number { 100 }
    start_time { Time.current }

    association :user
  end
end
