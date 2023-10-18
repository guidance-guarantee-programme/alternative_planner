module Api
  module V1
    class LocationsController < ApplicationController
      skip_before_action :authenticate_user!

      def index
        render json: Location.all.order(:name)
      end
    end
  end
end
