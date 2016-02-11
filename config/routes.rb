Rails.application.routes.draw do

  get 'sessions/new'

  namespace :admin do
  post 'items/create'
  end

  namespace :admin do
  get 'items/update'
  end

  namespace :admin do
  get 'items/destroy'
  end

  namespace :admin do
  get 'items/edit'
  end

  namespace :admin do
  get 'items/new'
  end

  namespace :admin do
  get 'items/show'
  end

  namespace :admin do
  get 'items/index'
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # resources :sessions
  resources :users
  resources :items, :only => [:show, :index]
  namespace :admin do
    resources :items
  end
  root 'items#index'
end
