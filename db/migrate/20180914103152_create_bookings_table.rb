class CreateBookingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |booking|
      booking.belongs_to :account, index: true
      booking.belongs_to :property, index: true
      booking.date :date
      booking.boolean :confirmed
    end
  end
end
