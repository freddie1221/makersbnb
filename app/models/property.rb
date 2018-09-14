class Property < ActiveRecord::Base
  belongs_to :account
  has_many :accounts, through: :bookings
  validates :account, presence: true
end
