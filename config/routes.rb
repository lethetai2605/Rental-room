Rails.application.routes.draw do
  namespace :admin do
      resources :profits, only: [:index]
      resources :accounts
      resources :profiles
      resources :providers
      resources :room_details
      resources :room_types
      resources :rooms
      resources :roles
      resources :bookings

      root to: "profits#index"
    end
  get 'profiles/update'
  get '/search', to: 'static_pages#search', as: 'room_search'
  resources :accounts
  root 'static_pages#home'
  patch '/rooms/:room_id/bookings/:booking_id/:status_id', to: 'bookings#update'
  resources :accounts, only: [:show] do
    resource :profile
  end

  devise_for :accounts,
  path: '',
  path_names: {sign_in: 'login' ,sign_out: 'logout' ,edit: 'profile',sign_up: 'resgistration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks' }

  resources :rooms do
    resource :room_detail
    resources :bookings
  end

  resources :bookings

end
