Rails.application.routes.draw do
  get 'profiles/update'
  get '/search', to: 'static_pages#search', as: 'room_search'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :accounts
  root 'static_pages#home'
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
