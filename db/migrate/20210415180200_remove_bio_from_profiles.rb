class RemoveBioFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :bio, :text
  end
end
