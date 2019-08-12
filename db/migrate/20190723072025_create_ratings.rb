class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :business_profile, foreign_key: true
      t.string :user_name
      t.integer :star_rating
      t.text :comment
      t.timestamps
    end
  end
end
