class CreateAccountsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |a|
      a.string :name
      a.string :email
    end
  end
end
