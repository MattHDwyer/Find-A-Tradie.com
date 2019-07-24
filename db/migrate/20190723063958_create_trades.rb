class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :trade_name
      t.text :trade_description

      t.timestamps
    end
  end
end
