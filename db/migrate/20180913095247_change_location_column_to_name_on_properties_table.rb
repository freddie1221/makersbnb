class ChangeLocationColumnToNameOnPropertiesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :properties do |c|
      c.rename :location, :name
    end
  end
end
