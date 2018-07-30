class BookingRequest < ApplicationRecord
  belongs_to :location, optional: true

  validates :first_name, presence: true

  def face_to_face?
    location_id.present?
  end
end
