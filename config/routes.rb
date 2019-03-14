Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, exept: :index
  resources :orders

  resources :items, only: [:index, :show] # /items

  get 'packages/:package_1_id,:package_2_id,:package_3_id', to: 'packages#show_multiple', as: :show_multiple_packages
  resources :packages


  get 'quiz', to: 'pages#quiz', as: :quiz
  resources :package_items

  get 'overview', to: 'users#overview', as: :overview


  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
