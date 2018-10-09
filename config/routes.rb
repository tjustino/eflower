# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  # get "exit", to: "sessions#destroy", as: :logout
  # This will create logout_path and logout_url as named helpers in your app
  # Calling logout_path will return /exit

  root "home#index"

  get "store", to: "store#index"
  get "admin", to: "admin#index"

  resources :carts
  resources :line_items, except: [:show]

  scope "admin", as: "admin" do
    resources :products, except: [:show]
  end
end
