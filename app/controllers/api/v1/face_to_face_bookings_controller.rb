module Api
  module V1
    class FaceToFaceBookingsController < ApplicationController
      wrap_parameters false

      skip_before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

      def create
        @booking = FaceToFaceBooking.new(booking_params)

        if @booking.save
          FaceToFaceGuiderNotificationsJob.perform_later(@booking)

          head :created
        else
          head :unprocessable_entity
        end
      end

      private

      def booking_params # rubocop:disable Metrics/MethodLength
        params.permit(
          :first_name,
          :last_name,
          :email,
          :phone,
          :memorable_word,
          :date_of_birth,
          :defined_contribution_pot_confirmed,
          :accessibility_requirements,
          :adjustments,
          :additional_info,
          :where_you_heard,
          :gdpr_consent,
          :support,
          :support_name,
          :support_relationship,
          :support_email,
          :support_phone
        )
      end
    end
  end
end
