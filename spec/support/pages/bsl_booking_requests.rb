module Pages
  class BslBookingRequests < SitePrism::Page
    set_url '/bsl_booking_requests'
    set_url_matcher %r{/\z|/bsl_booking_requests(?:.*)\z}

    sections :booking_requests, '.t-booking-request' do
      element :created_at, '.t-created-at'
      element :full_name, '.t-full-name'
      element :processed, '.t-processed'
      element :manage, '.t-manage'
    end
  end
end
