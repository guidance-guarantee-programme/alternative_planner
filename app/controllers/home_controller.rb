class HomeController < ApplicationController
  before_action do
    authorise_user!(any_of: [User::WELSH_PERMISSION, User::BSL_PERMISSION, User::FACE_TO_FACE_PERMISSION])
  end

  def index
    return redirect_to face_to_face_bookings_path if current_user.face_to_face?
    return redirect_to bsl_booking_requests_path if current_user.bsl?

    redirect_to booking_requests_path if current_user.welsh?
  end
end
