require 'rails_helper'

RSpec.describe FaceToFaceGuiderNotificationsJob, type: :job do
  it 'enqueues emails for each enabled face-to-face guider' do
    guider  = create(:face_to_face_guider)
    booking = build(:face_to_face_booking)

    create(:guider) # Welsh guider account, not notified

    expect(GuiderMailer).to receive(:booking_request)
      .with(guider, booking)
      .and_return(double.as_null_object)

    subject.perform(booking)
  end
end
