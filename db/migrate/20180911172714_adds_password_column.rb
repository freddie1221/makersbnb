class AddsPasswordColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :password, :string
  end
end
