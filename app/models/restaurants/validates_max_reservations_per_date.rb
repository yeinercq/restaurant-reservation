class Restaurants::ValidatesMaxReservationsPerDate < ActiveModel::Validator
  def validate(record)
    # binding.pry
    if Restaurant.reservations_per_date_count(record.booking_date) >= 20
      record.errors.add :base, "There are more than 20 reservations over all restaurants to this date."
    end
  end
end
