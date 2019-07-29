class BusinessProfile < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  has_many :trades, through: :business_profile_trades
  has_many :ratings

end
