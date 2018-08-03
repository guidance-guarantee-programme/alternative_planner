class BookingRequestsController < ApplicationController
  def index
    @booking_requests = BookingRequest.all.order(:created_at).page(params[:page])
  end

  def show
    @booking_request = BookingRequestDecorator.new(
      BookingRequest.find(params[:id])
    )
  end
end
