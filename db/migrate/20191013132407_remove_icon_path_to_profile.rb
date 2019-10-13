class RemoveIconPathToProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :icon_path, :string
  end
end
