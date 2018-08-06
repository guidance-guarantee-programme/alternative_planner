# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview
  def confirmation
    booking_request = FactoryBot.build_stubbed(:booking_request)

    CustomerMailer.confirmation(booking_request)
  end
end
