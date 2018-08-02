require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq', constraints: AuthenticatedUser.new

  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :locations, only: :index

      resources :booking_requests, only: :create
    end
  end

  resources :booking_requests, only: %i[index show]

  root 'booking_requests#index'
end
