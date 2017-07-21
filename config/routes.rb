Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
    resources :skills, only: [:new, :create, :index]
    resources :sharables, only: [:new, :create, :index]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
