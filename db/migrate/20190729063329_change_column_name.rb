class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :address, :full_address
  end
end
