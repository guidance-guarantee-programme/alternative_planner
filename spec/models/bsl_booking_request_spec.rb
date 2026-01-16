require 'rails_helper'

RSpec.describe BslBookingRequest do
  it 'is valid with valid attributes' do
    expect(build(:bsl_booking_request)).to be_valid
  end

  describe '.redact_for_gdpr' do
    it 'redacts records older than 2 years' do
      @redacted = create(:bsl_booking_request, created_at: 3.years.ago)
      @unredacted = create(:bsl_booking_request)

      BslBookingRequest.redact_for_gdpr

      expect(@redacted.reload).to have_attributes(
        first_name: 'redacted',
        last_name: 'redacted',
        email: 'redacted@example.com',
        phone: 'redacted',
        memorable_word: 'redacted',
        additional_info: 'redacted',
        date_of_birth: '1950-01-01'.to_date,
        support_name: 'redacted',
        support_relationship: 'redacted',
        support_phone: 'redacted',
        support_email: 'redacted'
      )

      expect(@unredacted.reload).to have_attributes(
        first_name: 'George',
        last_name: 'Smith'
      )
    end
  end
end
