Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :locations, only: :index

      resources :booking_requests, only: :create
    end
  end
end
