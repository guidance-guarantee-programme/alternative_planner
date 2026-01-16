require 'rails_helper'

RSpec.describe BookingRequest do
  it 'is valid with valid attributes' do
    expect(build(:booking_request)).to be_valid
  end

  describe '.redact_for_gdpr' do
    it 'redacts records older than 2 years' do
      @redacted = create(:booking_request, created_at: 3.years.ago)
      @unredacted = create(:booking_request)

      BookingRequest.redact_for_gdpr

      expect(@redacted.reload).to have_attributes(
        first_name: 'redacted',
        last_name: 'redacted',
        email: 'redacted@example.com',
        phone: 'redacted',
        memorable_word: 'redacted',
        additional_info: 'redacted'
      )

      expect(@unredacted.reload).to have_attributes(
        first_name: 'Daisy',
        last_name: 'Smith'
      )
    end
  end
end
