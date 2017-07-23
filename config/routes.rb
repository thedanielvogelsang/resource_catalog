Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
    get '/create-skills', to: "skills#new"
    get '/create-sharables', to: "sharables#new"
    resources :skills, only: [:create, :index]
    resources :sharables, only: [:create, :index]
  end
  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: "sessions#destroy"
  get '/login', to: "sessions#new"
  resources :users do
    resources :communities, only: [:new, :create]
  end
  resources :communities, only: [:show, :destroy, :edit, :update]

end
