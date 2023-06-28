class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :body_weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 300 }
    validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 300 }
  end

  has_many :trainings, dependent: :destroy
  has_many :calories, dependent: :destroy
end
