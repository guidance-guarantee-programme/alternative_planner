module Pages
  class BookingRequests < SitePrism::Page
    set_url '/booking_requests'
    set_url_matcher %r{/\z|/booking_requests(?:.*)\z}

    sections :booking_requests, '.t-booking-request' do
      element :created_at, '.t-created-at'
      element :full_name, '.t-full-name'
      element :booking_type, '.t-booking-type'
      element :processed, '.t-processed'
      element :manage, '.t-manage'
    end
  end
end
