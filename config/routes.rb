Rails.application.routes.draw do
  get 'admin/index'

  resources :products

  root 'products#index'
end
