class ChangeAccountId3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :date
  end
end
