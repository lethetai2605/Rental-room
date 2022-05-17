Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :accounts,
  path: '',
  path_names: {sign_in: 'login' ,sign_out: 'logout' ,edit: 'profile',sign_up: 'resgistration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks' }


end
