Rails.application.routes.draw do
  get 'admin/index'

  resources :products
  resources :admins
  resources :categories

  root 'products#index'
end
