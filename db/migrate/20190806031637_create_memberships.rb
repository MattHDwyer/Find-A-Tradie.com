class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.date :start_date
      t.date :exp_date

      t.timestamps
    end
  end
end
