class BusinessProfileTrade < ApplicationRecord
  belongs_to :business_profile
  belongs_to :trade
end
