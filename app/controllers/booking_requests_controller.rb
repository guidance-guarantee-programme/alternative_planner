class BookingRequestsController < ApplicationController
  def index
    @booking_requests = BookingRequest.all.order(:created_at).page(params[:page])
  end
end
