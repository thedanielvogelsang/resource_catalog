Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
    resources :skills, only: [:new, :create, :index]
    resources :sharables, only: [:new, :create, :index]
  end
  get ''
  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: "sessions#destroy"
  resources :users do
    resources :communities, only: [:new, :create, :destroy]
  end
  resources :communities, only: [:show]
end
