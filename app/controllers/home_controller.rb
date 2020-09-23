class HomeController < ApplicationController
  before_action do
    authorise_user!(any_of: [User::WELSH_PERMISSION, User::BSL_PERMISSION])
  end

  def index
    return redirect_to bsl_booking_requests_path if current_user.bsl?
    return redirect_to booking_requests_path if current_user.welsh?
  end
end
