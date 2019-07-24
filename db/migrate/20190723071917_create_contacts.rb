class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :mobile_number
      t.string :landline_number
      t.string :address

      t.timestamps
    end
  end
end
