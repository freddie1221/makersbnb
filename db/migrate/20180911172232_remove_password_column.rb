class RemovePasswordColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :password
  end
end
