Rails.application.routes.draw do


  get 'auctions/index'

  get 'auctions/new'

  get 'auctions/create'

  get 'auctions/show'

  get 'auctions/edit'

  get 'auctions/update'

  get 'auctions/destroy'

  devise_for :users

  root to: "home#index"

  resources :auctions, only: [:index, :create, :update, :edit, :destroy]


end
