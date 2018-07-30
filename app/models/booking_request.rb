class BookingRequest < ApplicationRecord
  belongs_to :location, optional: true

  def face_to_face?
    location_id.present?
  end
end
