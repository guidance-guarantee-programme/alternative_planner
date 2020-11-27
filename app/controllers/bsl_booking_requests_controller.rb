class BslBookingRequestsController < ApplicationController
  before_action do
    authorise_user!(User::BSL_PERMISSION)
  end

  def index
    @booking_requests = BslBookingRequest.all.order(:created_at).page(params[:page])
  end

  def show
    @booking_request = BslBookingRequestDecorator.new(
      BslBookingRequest.find(params[:id])
    )

    @note = Note.new(notable: @booking_request.object, user: current_user)
  end
end
