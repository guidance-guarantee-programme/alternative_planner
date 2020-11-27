class NotesController < ApplicationController
  def create
    Note.create!(notable: booking, message: note_params[:message], user: current_user)

    redirect_back fallback_location: root_path
  end

  private

  def booking
    if params[:booking_request_id]
      BookingRequest.find(params[:booking_request_id])
    else
      BslBookingRequest.find(params[:bsl_booking_request_id])
    end
  end

  def note_params
    params.require(:note).permit(:message)
  end
end
