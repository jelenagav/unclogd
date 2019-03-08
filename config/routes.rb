Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, exept: :index
  resources :orders

  resources :items, only: [:index, :show] # /items
  resources :packages

  get 'quiz', to: 'pages#quiz', as: :quiz
  resources :package_items

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
