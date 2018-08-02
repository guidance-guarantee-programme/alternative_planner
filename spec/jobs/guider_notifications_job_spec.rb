require 'rails_helper'

RSpec.describe GuiderNotificationsJob, type: :job do
  it 'enqueues emails for each enabled guider' do
    enabled_guider  = create(:guider)
    booking_request = build(:booking_request)

    create(:guider, disabled: true) # disabled account, not notified

    expect(GuiderMailer).to receive(:booking_request)
      .with(enabled_guider, booking_request)
      .and_return(double.as_null_object)

    subject.perform(booking_request)
  end
end
