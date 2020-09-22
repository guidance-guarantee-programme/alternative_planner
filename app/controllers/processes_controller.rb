class ProcessesController < ApplicationController
  before_action do
    authorise_user!(User::WELSH_PERMISSION)
  end

  def create
    @booking_request = BookingRequest.find(params[:booking_request_id])
    @booking_request.process!

    redirect_back success: 'The booking request was marked as processed.', fallback_location: root_path
  end
end
