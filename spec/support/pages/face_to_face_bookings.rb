module Pages
  class FaceToFaceBookings < SitePrism::Page
    set_url '/face_to_face_bookings'
    set_url_matcher %r{/\z|/face_to_face_bookings(?:.*)\z}

    sections :bookings, '.t-booking' do
      element :created_at, '.t-created-at'
      element :full_name, '.t-full-name'
      element :processed, '.t-processed'
      element :manage, '.t-manage'
    end
  end
end
