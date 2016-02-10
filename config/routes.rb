Rails.application.routes.draw do

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

  resources :users
  resources :items, :only => [:show, :index]
  namespace :admin do
    resources :items
  end
  root 'items#index'
end
