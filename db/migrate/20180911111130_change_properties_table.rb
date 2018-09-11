class ChangePropertiesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :properties do |property|
      property.change :account_id, foreign_key: true
    end
  end
end
