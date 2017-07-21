class UserSharable < ApplicationRecord
  belongs_to :user
  belongs_to :sharable
end
