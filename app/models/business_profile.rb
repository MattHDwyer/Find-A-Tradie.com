class BusinessProfile < ApplicationRecord
  belongs_to :user
  has_one :contact, dependent: :destroy
  has_many :business_profile_trades, dependent: :destroy
  has_many :trades, through: :business_profile_trades
  has_many :ratings, dependent: :destroy
end
