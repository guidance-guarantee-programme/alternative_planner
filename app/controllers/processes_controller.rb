class ProcessesController < ApplicationController
  before_action do
    authorise_user!(
      any_of: [User::WELSH_PERMISSION, User::BSL_PERMISSION, User::FACE_TO_FACE_PERMISSION]
    )
  end

  def create
    booking_request.process!

    redirect_back success: 'The booking request was marked as processed.', fallback_location: root_path
  end

  private

  def booking_request
    @booking_request ||= if params[:bsl_booking_request_id]
                           BslBookingRequest.find(params[:bsl_booking_request_id])
                         elsif params[:face_to_face_booking_id]
                           FaceToFaceBooking.find(params[:face_to_face_booking_id])
                         else
                           BookingRequest.find(params[:booking_request_id])
                         end
  end
end
