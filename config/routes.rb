Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:new, :create]
    collection do
      get 'mine'
    end
  end
  # get 'cars/mine', to: 'cars#mine'
  resources :bookings, only: [:destroy]
end
