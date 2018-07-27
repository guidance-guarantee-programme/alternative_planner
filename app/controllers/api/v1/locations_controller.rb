module Api
  module V1
    class LocationsController < ActionController::Base
      def index
        render json: Location.all.order(:name)
      end
    end
  end
end
