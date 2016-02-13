Rails.application.routes.draw do

  get 'sessions/new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :categories, :only => [:show, :index]

  # resources :sessions
  resources :orders
  resources :purchased_items


  resources :users
  resources :items, :only => [:show, :index]
  namespace :admin do
    resources :items
  end
  root 'items#index'
end
