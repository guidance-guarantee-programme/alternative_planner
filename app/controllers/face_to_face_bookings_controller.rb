class FaceToFaceBookingsController < ApplicationController
  before_action do
    authorise_user!(User::FACE_TO_FACE_PERMISSION)
  end

  def index
    @bookings = FaceToFaceBooking.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @booking = FaceToFaceBookingDecorator.new(
      FaceToFaceBooking.find(params[:id])
    )

    @note = Note.new(notable: @booking.object, user: current_user)
  end
end
