class CreateBusinessProfileTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :business_profile_trades do |t|
      t.references :business_profile, foreign_key: true
      t.references :trade, foreign_key: true

      t.timestamps
    end
  end
end
