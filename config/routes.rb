Rails.application.routes.draw do
  #devise_for :doctors
  devise_for :doctors
  authenticated :doctor do
    root to: 'availabilities#new', as: :doctor_root
  end
  resources :doctors, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb
  devise_for :patients
  resources :patients, only: [:new, :create]
  resources :patients, only: [:new, :create, :index] do
    post 'book_appointment', on: :member
  end
  root 'pages#home'
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy'
  resources :availabilities, only: [:new, :create]
  resources :appointments
  get '/patients/:doctor_id/book_appointment', to: 'patients#book_appointment', as: 'book_appointment'
  resources :notifications, only: [:index, :new, :create]
  resources :triggers do
    resources :notifications
  end
end
