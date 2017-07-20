class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name,
                        :last_name,
                        :phone,
                        :email,
                        :zipcode,
                        :password, confirmation: true
                        :password_confirmation
end
