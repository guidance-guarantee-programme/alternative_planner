require 'rails_helper'

RSpec.describe GuiderMailer do
  it 'is rendered correctly' do
    booking_request = create(:booking_request)
    guider = create(:guider)

    email = described_class.booking_request(guider, booking_request)

    expect(email.to).to contain_exactly('rick@example.com')
    expect(email.body.encoded).to include("/booking_requests/#{booking_request.id}")
  end
end
