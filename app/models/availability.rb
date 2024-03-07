class Availability < ApplicationRecord
  belongs_to :doctor
  enum status: { available: 'available', booked: 'booked', canceled: 'canceled' }
end
