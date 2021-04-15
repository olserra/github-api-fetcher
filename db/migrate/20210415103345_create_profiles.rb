class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :login
      t.string :url
      t.text :bio

      t.timestamps
    end
  end
end
