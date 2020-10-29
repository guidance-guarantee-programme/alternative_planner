require 'rails_helper'

RSpec.describe BslGuiderNotificationsJob, type: :job do
  it 'enqueues emails for each enabled BSL guider' do
    bsl_guider      = create(:bsl_guider)
    booking_request = build(:bsl_booking_request)

    create(:guider) # Welsh guider account, not notified

    expect(GuiderMailer).to receive(:booking_request)
      .with(bsl_guider, booking_request)
      .and_return(double.as_null_object)

    subject.perform(booking_request)
  end
end
