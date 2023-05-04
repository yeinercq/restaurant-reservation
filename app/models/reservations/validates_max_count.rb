class Reservations::ValidatesMaxCount < ActiveModel::Validator
  def validate(record)
    # binding.pry
    if record.restaurant.current_reservations_count(record.booking_date) >= 15
      record.errors.add :base, "There are not available tables to this date."
    end
  end
end
