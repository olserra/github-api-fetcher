class AddReposToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :repos, :integer
  end
end
