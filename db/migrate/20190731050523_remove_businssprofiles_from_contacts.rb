class RemoveBusinssprofilesFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :business_profiles_id
  end
end
