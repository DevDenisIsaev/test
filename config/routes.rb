Admin::Application.routes.draw do
  root to: 'sessions#new'
  get "users/new"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy'
  match '/data', to: 'data#index'

end
