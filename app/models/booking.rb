class Booking < ActiveRecord::Base
  belongs_to :account
  belongs_to :property
  validates :account, presence: true
  validates :property, presence: true
end