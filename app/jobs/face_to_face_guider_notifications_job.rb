class FaceToFaceGuiderNotificationsJob < ApplicationJob
  queue_as :default

  def perform(booking)
    User.face_to_face_guiders.each do |user|
      GuiderMailer.booking_request(user, booking).deliver_later
    end
  end
end
