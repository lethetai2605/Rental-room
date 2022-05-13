Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :accounts
  as :account do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  resources :rooms do
    resource :room_detail
  end

end
