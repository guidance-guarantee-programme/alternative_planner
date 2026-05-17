require 'rails_helper'

RSpec.feature 'Guider views face-to-face bookings' do
  scenario 'When unauthenticated, redirect to login' do
    with_real_sso do
      when_the_guider_views_the_face_to_face_bookings
      then_they_see_a_missing_status
    end
  end

  scenario 'Viewing the bookings' do
    given_the_user_identifies_as(:face_to_face_guider) do
      and_several_face_to_face_bookings_exist
      when_the_guider_views_the_face_to_face_bookings
      then_the_face_to_face_bookings_are_displayed
    end
  end

  def and_several_face_to_face_bookings_exist
    create_list(:face_to_face_booking, 5)
  end

  def when_the_guider_views_the_face_to_face_bookings
    visit face_to_face_bookings_path
  end

  def then_the_face_to_face_bookings_are_displayed # rubocop:disable Metrics/AbcSize
    @page = Pages::FaceToFaceBookings.new
    expect(@page).to be_displayed
    expect(@page).to have_bookings(count: 5)

    @first = @page.bookings.first
    expect(@first.created_at).to have_text('less than a minute ago')
    expect(@first.full_name).to have_text('George Smith')
    expect(@first.processed).to have_text('No')
  end

  def then_they_see_a_missing_status
    expect(page.status_code).to eq(404)
  end
end
