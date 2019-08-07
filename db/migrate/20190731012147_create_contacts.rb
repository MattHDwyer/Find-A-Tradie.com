class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :mobile_number
      t.string :landline_number
      t.string :full_address
      t.float :latitude
      t.float :longitude
      t.references :business_profile, foreign_key: true
      t.timestamps
    end
  end
end
