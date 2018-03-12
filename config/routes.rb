Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :edit, :update]

  # resources :sessions, only: [:new, :create, :destroy]

  root to: 'sessions#new'

  get   '/login'  => 'sessions#new', as: 'login'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy', as: 'logout'

  get   '/marvel' => 'apis#fetch', as: 'fetch'
end
