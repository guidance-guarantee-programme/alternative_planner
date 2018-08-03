class BookingRequestDecorator < SimpleDelegator
  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def booking_type
    object.face_to_face? ? 'Face-to-face' : 'Telephone'
  end

  def processed
    object.processed_at? ? 'Yes' : 'No'
  end

  def location_name
    object.location_id ? object.location.name : ''
  end

  def consent
    object.gdpr_consent.present? ? object.gdpr_consent.titleize : 'No response'
  end

  alias object __getobj__
end
