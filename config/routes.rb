Rails.application.routes.draw do
  devise_for :users

  get 'profile' => 'users#profile'

  root to: 'pets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets, only: [:new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  patch "/archive_booking/:id", to: 'bookings#archive'
end
