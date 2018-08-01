require 'rails_helper'

RSpec.feature 'Guider views booking requests' do
  scenario 'When unauthenticated, redirect to login' do
    with_real_sso do
      expect { when_the_guider_views_the_booking_requests }.to raise_error(
        ActionController::RoutingError, 'No route matches [GET] "/oauth/authorize"'
      )
    end
  end

  scenario 'Viewing the booking requests index' do
    given_a_guider_is_logged_in
    and_several_booking_requests_exist
    when_the_guider_views_the_booking_requests
    then_the_booking_requests_are_displayed
  end

  def given_a_guider_is_logged_in
    @guider = create(:guider)
  end

  def and_several_booking_requests_exist
    create_list(:booking_request, 5, :face_to_face)
    create_list(:booking_request, 6) # telephone bookings
  end

  def when_the_guider_views_the_booking_requests
    visit root_path
  end

  def then_the_booking_requests_are_displayed # rubocop:disable AbcSize
    @page = Pages::BookingRequests.new
    expect(@page).to be_displayed
    expect(@page).to have_booking_requests(count: 10) # paginated

    @first = @page.booking_requests.first
    expect(@first.created_at).to have_text('less than a minute ago')
    expect(@first.full_name).to have_text('Daisy Smith')
    expect(@first.booking_type).to have_text('Face-to-face')
    expect(@first.processed).to have_text('No')
  end

  def with_real_sso
    sso_env = ENV['GDS_SSO_MOCK_INVALID']
    ENV['GDS_SSO_MOCK_INVALID'] = '1'

    yield
  ensure
    ENV['GDS_SSO_MOCK_INVALID'] = sso_env
  end
end
