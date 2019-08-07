class AddColumnsToMembership < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :start_date, :date
    add_column :memberships, :end_date, :date
    add_reference :memberships, :business_profile, foreign_key: true
  end
end
