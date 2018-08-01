class BookingRequestDecorator < SimpleDelegator
  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def booking_type
    object.location_id ? 'Face-to-face' : 'Telephone'
  end

  def processed
    object.processed_at? ? 'Yes' : 'No'
  end

  alias object __getobj__
end
