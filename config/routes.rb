Rails.application.routes.draw do
  devise_for :users
    resources :rides
  root 'rides#index'
end
