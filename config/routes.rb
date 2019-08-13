Rails.application.routes.draw do

  # Admin Site
  devise_for :admins
  root to: "devices#index"
  resources :devices, only: [:index, :show]
  resources :admins, only: [:index] do
    post :block
    post :unblock
  end

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
