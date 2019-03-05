Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, exept: :index
  resources :orders

  resources :items, only: [:index, :show] # /items
  resources :packages
  resources :package_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
