class RemoveContactFromBusinssprofiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :business_profiles, :contact_id, :integer
  end
end
