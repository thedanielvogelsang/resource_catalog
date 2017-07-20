Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :skills, only: [:new, :create]

end
