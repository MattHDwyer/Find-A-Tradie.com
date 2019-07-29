class Trade < ApplicationRecord
    has_many :business_profile_trades
    has_many :business_profiles, through: :business_profile_trades
end
