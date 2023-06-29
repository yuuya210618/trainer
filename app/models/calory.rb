class Calory < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :calories_intake, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }
    validates :start_time
  end
end
