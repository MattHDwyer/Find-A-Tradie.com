class AddUserToBusinessProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_profiles, :user, foreign_key: true
  end
end
