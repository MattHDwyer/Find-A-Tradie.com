class Contact < ApplicationRecord
  has_one :business_profiles

  geocoded_by :address
  after_validation :geocode

  def address
    self.full_address
  end

end
