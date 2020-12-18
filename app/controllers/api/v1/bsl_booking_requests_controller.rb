module Api
  module V1
    class BslBookingRequestsController < ActionController::Base
      wrap_parameters false

      skip_before_action :verify_authenticity_token

      def create
        @booking_request = BslBookingRequest.new(booking_request_params)

        if @booking_request.save
          BslGuiderNotificationsJob.perform_later(@booking_request)

          head :created
        else
          head :unprocessable_entity
        end
      end

      private

      def booking_request_params # rubocop:disable MethodLength
        params.permit(
          :first_name,
          :last_name,
          :email,
          :phone,
          :memorable_word,
          :date_of_birth,
          :defined_contribution_pot_confirmed,
          :accessibility_needs,
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
