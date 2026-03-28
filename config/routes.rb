Rails.application.routes.draw do
  resource :session
  resource :registration, only: [ :new, :create ]
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
  get "dashboard", to: "dashboard#index", as: :dashboard

  resources :habits_tracker, only: [ :index ], controller: "habits_tracker" do
    collection do
      get :calendar
    end
  end

  resources :habits, except: [ :show ] do
    resource :tracking, only: [ :create, :destroy ], controller: "habit_trackings"
    collection do
      patch :sort
    end
  end
end
