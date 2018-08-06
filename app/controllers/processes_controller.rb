class ProcessesController < ApplicationController
  def create
    @booking_request = BookingRequest.find(params[:booking_request_id])
    @booking_request.process!

    redirect_back success: 'The booking request was marked as processed.', fallback_location: root_path
  end
end
