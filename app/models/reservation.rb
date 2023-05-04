# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer          not null
#  booking_date  :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Reservation < ApplicationRecord
  belongs_to :restaurant

  validates :booking_date, presence: true

  scope :ordered, -> {order(id: :desc)}
end
