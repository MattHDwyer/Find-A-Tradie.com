class BusinessProfile < ApplicationRecord
  belongs_to :user
  has_one :contact, dependent: :destroy
  has_many :business_profile_trades, dependent: :destroy
  has_many :trades, through: :business_profile_trades
  has_many :ratings, dependent: :destroy
  has_many_attached :images
  has_one_attached :logo_image
end
