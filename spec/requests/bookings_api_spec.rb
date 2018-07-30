require 'rails_helper'

RSpec.describe 'POST /api/v1/booking_requests.json' do
  scenario 'Creating a valid phone booking request' do
    payload = {
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

    post api_v1_booking_requests_path, params: payload, as: :json

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
