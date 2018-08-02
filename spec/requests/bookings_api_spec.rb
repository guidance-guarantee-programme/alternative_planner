require 'rails_helper'

RSpec.describe 'POST /api/v1/booking_requests.json' do
  let(:payload) do
    {
      'first_name' => 'George',
      'last_name' => 'Smithson',
      'email' => 'george@example.com',
      'phone' => '02082551234',
      'memorable_word' => 'starfishes',
      'date_of_birth' => '1960-01-01',
      'defined_contribution_pot_confirmed' => true,
      'accessibility_needs' => false,
      'additional_info' => 'Not before 3PM if possible.',
      'where_you_heard' => '1', # An employer
      'gdpr_consent' => 'yes'
    }
  end

  scenario 'Attempting to create an invalid booking request' do
    payload_without_name = payload.merge('first_name' => '')

    post api_v1_booking_requests_path, params: payload_without_name, as: :json

    expect(response).to be_unprocessable
  end

  scenario 'Creating a valid face-to-face booking request' do
    payload_with_location = payload.merge('location_id' => create(:location).to_param)

    post api_v1_booking_requests_path, params: payload_with_location, as: :json

    assert_enqueued_jobs(1, only: GuiderNotificationsJob)

    expect(response).to be_created

    expect(BookingRequest.last).to be_face_to_face
  end

  scenario 'Creating a valid phone booking request' do
    post api_v1_booking_requests_path, params: payload, as: :json

    assert_enqueued_jobs(1, only: GuiderNotificationsJob)

    expect(response).to be_created

    @booking_request = BookingRequest.last
    expect(@booking_request).to have_attributes(
      first_name: 'George',
      last_name: 'Smithson',
      email: 'george@example.com',
      phone: '02082551234',
      memorable_word: 'starfishes',
      date_of_birth: '1960-01-01'.to_date,
      defined_contribution_pot_confirmed: true,
      accessibility_needs: false,
      additional_info: 'Not before 3PM if possible.',
      where_you_heard: 1,
      gdpr_consent: 'yes'
    )

    expect(@booking_request).to_not be_face_to_face
  end
end
