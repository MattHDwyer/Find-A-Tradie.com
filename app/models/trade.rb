class Trade < ApplicationRecord
  has_many :business_profile_trades, dependent: :destroy
  has_many :business_profiles, through: :business_profile_trades
end
