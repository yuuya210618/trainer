class Training < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :training_name
    validates :weight
    validates :number
  end

end
