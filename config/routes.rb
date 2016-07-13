Rails.application.routes.draw do
  get 'admin/index'

  resources :products
  resources :admins

  root 'products#index'
end
