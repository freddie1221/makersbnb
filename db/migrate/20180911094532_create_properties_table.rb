class CreatePropertiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |property|
      property.belongs_to :account, index: true
      property.string  :location
      property.integer :price
      property.integer :date
    end
  end
end
