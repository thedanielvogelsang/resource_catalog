class Asset < ApplicationRecord
  validates :asset, presence: true
end
