require 'rails_helper'

RSpec.describe GuiderMailer do
  context 'for a Welsh booking request' do
    it 'is rendered correctly' do
      booking_request = create(:booking_request)
      guider = create(:guider)

      email = described_class.booking_request(guider, booking_request)

      expect(email.to).to contain_exactly('rick@example.com')
      expect(email.subject).to eq('Pension Wise Welsh Language Booking Request')
      expect(email.body.encoded).to include("/booking_requests/#{booking_request.id}")
      expect(email.body.encoded).to include('Welsh Language')
    end
  end

  context 'for a BSL booking request' do
    it 'is rendered correctly' do
      booking_request = create(:bsl_booking_request)
      guider = create(:bsl_guider)

      email = described_class.booking_request(guider, booking_request)

      expect(email.to).to contain_exactly('rick@example.com')
      expect(email.subject).to eq('Pension Wise BSL Booking Request')
      expect(email.body.encoded).to include("/bsl_booking_requests/#{booking_request.id}")
      expect(email.body.encoded).to include('BSL')
    end
  end
end
