class CustomerMailer < ApplicationMailer
  def confirmation(booking_request)
    @booking_request = booking_request

    mail to: booking_request.email, subject: 'Pension Wise Rydym wedi derbyn eich cais am apwyntiad'
  end
end
