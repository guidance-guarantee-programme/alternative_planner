module Api
  module V1
    class BookingRequestsController < ActionController::Base
      wrap_parameters false

      def create
        @booking_request = BookingRequest.new(booking_request_params)

        if @booking_request.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      private

      def booking_request_params # rubocop:disable MethodLength
        params.permit(
          :location_id,
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
          :gdpr_consent
        )
      end
    end
  end
end
