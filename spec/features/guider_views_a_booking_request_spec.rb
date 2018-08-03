require 'rails_helper'

RSpec.feature 'Guider views a booking request' do
  scenario 'Viewing a face-to-face booking' do
    given_the_user_identifies_as(:guider) do
      and_a_face_to_face_booking_exists
      when_the_guider_views_the_booking
      then_the_booking_is_displayed
    end
  end

  def and_a_face_to_face_booking_exists
    @booking = create(:booking_request, :face_to_face)
  end

  def when_the_guider_views_the_booking
    @page = Pages::BookingRequest.new
    @page.load(id: @booking.id)
  end

  def then_the_booking_is_displayed # rubocop:disable MethodLength, AbcSize
    expect(@page).to be_displayed
    expect(@page.booking_type).to have_text('Face-to-face')
    expect(@page.location_name.text).to match(/Location \d+/)

    expect(@page.full_name).to have_value('Daisy Smith')
    expect(@page.phone).to have_value('02082524729')
    expect(@page.email).to have_value('daisy@example.com')
    expect(@page.memorable_word).to have_value('spacetravel')
    expect(@page.year_of_birth).to have_value('1960')
    expect(@page.month_of_birth).to have_value('1')
    expect(@page.day_of_birth).to have_value('1')
    expect(@page.defined_contribution_pot_confirmed_yes).to be_checked
    expect(@page.accessibility_needs).not_to be_checked
    expect(@page.additional_info).to have_value('')
    expect(@page.gdpr_consent).to have_text('Yes')
  end
end
