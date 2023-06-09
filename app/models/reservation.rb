# == Schema Information
#
# Table name: reservations
#
#  id            :bigint           not null, primary key
#  restaurant_id :integer          not null
#  booking_date  :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Reservation < ApplicationRecord
  belongs_to :restaurant

  validates :booking_date, presence: true
  validates_with Restaurants::ValidatesMaxReservationsPerDate
  validates_with Reservations::ValidatesMaxCount

  scope :ordered, -> {order(booking_date: :desc)}
end
