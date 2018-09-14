class Account < ActiveRecord::Base
  has_many :properties, dependent: :destroy
  has_many :bookings
  has_many :properties, through: :bookings
end
