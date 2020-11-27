class BookingRequestsController < ApplicationController
  before_action do
    authorise_user!(User::WELSH_PERMISSION)
  end

  def index
    @booking_requests = BookingRequest.all.order(:created_at).page(params[:page])
  end

  def show
    @booking_request = BookingRequestDecorator.new(
      BookingRequest.find(params[:id])
    )

    @note = Note.new(notable: @booking_request.object, user: current_user)
  end
end
