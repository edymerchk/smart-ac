Rails.application.routes.draw do

  # Admin Site
  devise_for :admins
  root to: "home#index"

  # API
  namespace :api do
    namespace :v1 do
      resources :devices, only: [:create]
      resources :reports, only: [:create] do
        post :create_bulk, on: :collection
      end
    end
  end
end
