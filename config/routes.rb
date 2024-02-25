Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'home#welcome', as: :unauthenticated_root
    end
  end
  resources :students
  resources :users
  resources :exam_schedules
  resources :exam_halls
  resources :batches
  resources :departments
  resources :subjects

  get 'attendances/index'

  get 'home/index'
  get 'home/welcome'
end
