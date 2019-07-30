class AddBusinessnameToBusinessprofiles < ActiveRecord::Migration[5.2]
  def change
    add_column :business_profiles, :business_name, :string
  end
end
