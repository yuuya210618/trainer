class Calory < ApplicationRecord
  belongs_to :user

  validates :calories_intake, presence: true
end
