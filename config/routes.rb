Rails.application.routes.draw do
  resources :accounts
  root 'static_pages#home'
  resources :accounts, only: [:show]

  devise_for :accounts,
  path: '',
  path_names: {sign_in: 'login' ,sign_out: 'logout' ,edit: 'profile',sign_up: 'resgistration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks' }

  resources :rooms do
    resource :room_detail
  end
end
