# Preview all emails at http://localhost:3001/rails/mailers/guider_mailer
class GuiderMailerPreview < ActionMailer::Preview
  def booking_request
    booking_request = FactoryBot.build_stubbed(:booking_request)
    guider = FactoryBot.build_stubbed(:guider)

    GuiderMailer.booking_request(guider, booking_request)
  end
end
