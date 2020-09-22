class GuiderMailer < ApplicationMailer
  def booking_request(guider, booking_request)
    @booking_request = booking_request

    mail to: guider.email, subject: "Pension Wise #{booking_request.booking_type} Booking Request"
  end
end
