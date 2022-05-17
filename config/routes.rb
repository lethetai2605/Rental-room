Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :accounts,
  path: '',
  path_names: {sign_in: 'login' ,sign_out: 'logout' ,edit: 'profile',sign_up: 'resgistration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks' }

  resources :rooms do
    resource :room_detail
  end
end
