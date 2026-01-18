# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users
  devise_for :admins
  root "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :administrate do
    get "/" => "dashboards#index"
    resources :acompanhantes do
      member do
        delete "destroy_img_destaque_1"
        delete "destroy_img_destaque_2"
        delete "destroy_img_destaque_3"
        delete "destroy_img_destaque_4"
        delete "destroy_img_destaque_5"
        delete "destroy_img_destaque_6"
      end
    end
    resources :articles do
      member do
        delete "destroy_cover_image"
      end
    end
  end

  get "/inicio", to: "welcome#index"
  get "/home", to: "home#index"
end
