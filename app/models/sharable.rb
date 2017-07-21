class Sharable < ApplicationRecord
  validates :sharable, presence: true
  has_many :user_sharables
  has_many :users, through: :user_sharables
end
