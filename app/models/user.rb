class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name,
                        :last_name,
                        :phone,
                        :email,
                        :zipcode,
                        :password, confirmation: true
                        :password_confirmation
  validates :username, presence: true, uniqueness: true
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :user_sharables
  has_many :sharables, through: :user_sharables
  has_many :user_communities
  has_many :communities, through: :user_communities
  enum role: %w(default member admin)
end
