# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get "admin", to: "admin#index"

  scope "admin", as: "admin" do
    resources :users,  except: [:show]
    resources :stores, except: [:show]
  end
end
