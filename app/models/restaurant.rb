# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  address     :string
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  photo       :string
#
class Restaurant < ApplicationRecord
  validates :name, :description, :address, :city, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  scope :ordered, -> {order(id: :desc)}

  has_many :reservations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def current_reservations_count(date)
    reservations.where("booking_date = ?", date).count
  end

  def today_reservations_count
    reservations.where("booking_date = ?", Date.today).count
  end

  def self.reservations_per_date_count(date)
    Reservation.where("booking_date = ?", date).count
  end
end
