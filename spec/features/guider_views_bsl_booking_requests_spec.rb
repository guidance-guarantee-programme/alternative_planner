require 'rails_helper'

RSpec.feature 'Guider views BSL booking requests' do
  scenario 'When unauthenticated, redirect to login' do
    with_real_sso do
      expect { when_the_guider_views_the_booking_requests }.to raise_error(
        ActionController::RoutingError, 'No route matches [GET] "/oauth/authorize"'
      )
    end
  end

  scenario 'Viewing the booking requests index' do
    given_the_user_identifies_as(:bsl_guider) do
      and_several_booking_requests_exist
      when_the_guider_views_the_booking_requests
      then_the_booking_requests_are_displayed
    end
  end

  def and_several_booking_requests_exist
    create_list(:bsl_booking_request, 11)
  end

  def when_the_guider_views_the_booking_requests
    visit bsl_booking_requests_path
  end

  def then_the_booking_requests_are_displayed # rubocop:disable AbcSize
    @page = Pages::BslBookingRequests.new
    expect(@page).to be_displayed
    expect(@page).to have_booking_requests(count: 10) # paginated

    @first = @page.booking_requests.first
    expect(@first.created_at).to have_text('less than a minute ago')
    expect(@first.full_name).to have_text('George Smith')
    expect(@first.processed).to have_text('No')
  end
end
