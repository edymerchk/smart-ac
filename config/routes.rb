Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :devices, only: [:create]
      resources :reports, only: [:create]
    end
  end
end
