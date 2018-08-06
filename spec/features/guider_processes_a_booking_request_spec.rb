require 'rails_helper'

RSpec.feature 'Guider processes a booking request' do
  scenario 'Successfully processing a booking request', js: true do
    given_the_user_identifies_as(:guider) do
      and_an_unprocessed_booking_request_exists
      when_the_guider_views_the_booking
      and_processes_the_booking
      then_the_booking_is_processed
      and_the_guider_is_informed
    end
  end

  def and_an_unprocessed_booking_request_exists
    @booking = create(:booking_request)
  end

  def when_the_guider_views_the_booking
    @page = Pages::BookingRequest.new
    @page.load(id: @booking.id)

    expect(@page).to be_displayed
  end

  def and_processes_the_booking
    @page.process.click
  end

  def then_the_booking_is_processed
    expect(@page.processed).to have_text('Yes')
  end

  def and_the_guider_is_informed
    expect(@page).to have_text('was marked as processed')
  end
end
