Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  resources :auctions, only: [:index, :new, :create, :update, :edit, :destroy]


end
