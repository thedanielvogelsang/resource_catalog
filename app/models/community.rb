class Community < ApplicationRecord
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
  has_many :admins, dependent: :destroy
  has_many :skills, through: :users
  validates_presence_of :name, :description
end
