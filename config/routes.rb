Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get 'about' => 'about#index'

  get 'password' => 'passwords#edit', as: :edit_password
  patch 'password' => 'passwords#update'

  get 'sign_up' => 'registrations#new'
  post 'sign_up' => 'registrations#create'

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'password/reset' => 'password_resets#new'
  post 'password/reset' => 'password_resets#create'
  get 'password/reset/edit' => 'password_resets#edit'
  patch 'password/reset/edit' => 'password_resets#update'

  root 'main#index'
end
