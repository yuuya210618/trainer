class Training < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :training_name
    validates :weight,numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 300 }
    validates :number,numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    validates :start_time
  end

end
