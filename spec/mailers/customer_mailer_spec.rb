require 'rails_helper'

RSpec.describe CustomerMailer do
  it 'is rendered correctly' do
    booking_request = create(:booking_request)

    email = described_class.confirmation(booking_request)

    expect(email.to).to contain_exactly('daisy@example.com')
    expect(email.body.encoded).to include('Annwyl Daisy')
  end
end
