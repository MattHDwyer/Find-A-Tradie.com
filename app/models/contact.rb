class Contact < ApplicationRecord
  belongs_to :business_profile

  geocoded_by :address
  after_validation :geocode

  def address
    self.full_address
  end
end
