Rails.application.routes.draw do
  devise_for :users
  devise_for :artists

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  authenticated :artist do
    root "artists#dashboard", as: :authenticated_artist_root
    resources :songs
    resource :dashboard, to: "artists#dashboard"
  end

  resource :music, only: [ :show ], controller: :music do
    post "audio_player", to: "music#audio_player", on: :collection
  end

  # Defines the root path route ("/")
  root "home#index"
end
