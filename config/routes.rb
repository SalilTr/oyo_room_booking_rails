Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  
  resources :rooms do
    resources :bookings
  end

  root 'rooms#index'
end
