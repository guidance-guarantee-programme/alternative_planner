require 'rails_helper'

RSpec.feature 'BSL guider views a booking request' do
  scenario 'Viewing a BSL booking' do
    given_the_user_identifies_as(:bsl_guider) do
      and_a_bsl_booking_exists
      when_the_guider_views_the_booking
      then_the_booking_is_displayed
    end
  end

  def and_a_bsl_booking_exists
    @booking = create(:bsl_booking_request)
  end

  def when_the_guider_views_the_booking
    @page = Pages::BslBookingRequest.new
    @page.load(id: @booking.id)
  end

  def then_the_booking_is_displayed # rubocop:disable MethodLength, AbcSize
    expect(@page).to be_displayed

    expect(@page.full_name).to have_value('George Smith')
    expect(@page.phone).to have_value('02082524728')
    expect(@page.email).to have_value('george@example.com')
    expect(@page.memorable_word).to have_value('space')
    expect(@page.year_of_birth).to have_value('1965')
    expect(@page.month_of_birth).to have_value('1')
    expect(@page.day_of_birth).to have_value('1')
    expect(@page.defined_contribution_pot_confirmed_yes).to be_checked
    expect(@page.accessibility_needs).not_to be_checked
    expect(@page.additional_info).to have_value('')
    expect(@page.gdpr_consent).to have_text('No')
  end
end
