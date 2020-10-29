require 'rails_helper'

RSpec.describe 'POST /api/v1/bsl_booking_requests.json' do
  let(:payload) do
    {
      'first_name' => 'David',
      'last_name' => 'Davidson',
      'email' => 'david@example.com',
      'phone' => '0208 595 0286',
      'memorable_word' => 'starfish',
      'date_of_birth' => '1970-01-01',
      'defined_contribution_pot_confirmed' => true,
      'accessibility_needs' => false,
      'additional_info' => '',
      'where_you_heard' => 1, # An employer
      'gdpr_consent' => 'yes'
    }
  end

  scenario 'Attempting to create an invalid BSL booking request' do
    payload_without_name = payload.merge('first_name' => '')

    post api_v1_bsl_booking_requests_path, params: payload_without_name, as: :json

    expect(response).to be_unprocessable
  end

  scenario 'Creating a valid BSL booking request' do
    post api_v1_bsl_booking_requests_path, params: payload, as: :json

    assert_enqueued_jobs(1, only: BslGuiderNotificationsJob)

    expect(response).to be_created

    expect(BslBookingRequest.last).to have_attributes(
      payload.merge('date_of_birth' => '1970-01-01'.to_date)
    )
  end
end
