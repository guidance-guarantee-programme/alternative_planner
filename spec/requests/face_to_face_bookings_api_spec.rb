require 'rails_helper'

RSpec.describe 'POST /api/v1/face_to_face_bookings.json' do
  let(:payload) do
    {
      'first_name' => 'David',
      'last_name' => 'Davidson',
      'email' => 'david@example.com',
      'phone' => '0208 595 0286',
      'memorable_word' => 'starfish',
      'date_of_birth' => '1970-01-01',
      'defined_contribution_pot_confirmed' => true,
      'accessibility_requirements' => false,
      'additional_info' => '',
      'where_you_heard' => 1, # An employer
      'gdpr_consent' => 'yes',
      'support' => 'yes',
      'support_name' => 'Dave Jones',
      'support_relationship' => 'Husband',
      'support_email' => 'dave@example.com',
      'support_phone' => '07717 383 488',
      'postcode' => 'RG1 1AL',
      'referrer' => 'Pension Co.'
    }
  end

  scenario 'Attempting to create an invalid face-to-face booking' do
    payload_without_name = payload.merge('first_name' => '')

    post api_v1_face_to_face_bookings_path, params: payload_without_name, as: :json

    expect(response).to be_unprocessable
  end

  scenario 'Creating a valid face-to-face booking' do
    post api_v1_face_to_face_bookings_path, params: payload, as: :json

    assert_enqueued_jobs(1, only: FaceToFaceGuiderNotificationsJob)

    expect(response).to be_created

    expect(FaceToFaceBooking.last).to have_attributes(
      payload.merge('date_of_birth' => '1970-01-01'.to_date)
    )
  end
end
