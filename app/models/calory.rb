class Calory < ApplicationRecord
  belongs_to :user
  with_options presence: true do
  validates :calories_intake
  validates :start_time
end
end
