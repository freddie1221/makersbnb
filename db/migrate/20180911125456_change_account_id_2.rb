class ChangeAccountId2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :account_id
    add_column :properties, :account_id, :integer
    add_foreign_key :properties, :accounts
  end
end
