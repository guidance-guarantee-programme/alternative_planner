class GuiderNotificationsJob < ApplicationJob
  queue_as :default

  def perform(booking_request)
    User.welsh_guiders.each do |user|
      GuiderMailer.booking_request(user, booking_request).deliver_later
    end
  end
end
