class CreateBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :business_profiles do |t|
      t.references :contact, foreign_key: true
      t.text :business_profile_description
      t.string :australian_business_number

      t.timestamps
    end
  end
end
