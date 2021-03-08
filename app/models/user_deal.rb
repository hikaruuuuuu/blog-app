class UserDeal < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_one :address
end
