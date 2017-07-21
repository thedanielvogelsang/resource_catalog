class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name,
                        :last_name,
                        :phone,
                        :email,
                        :zipcode,
                        :password, confirmation: true
                        :password_confirmation
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :user_sharables
  has_many :sharables, through: :user_sharables
end
