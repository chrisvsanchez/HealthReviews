Rails.application.routes.draw do
  # get 'pages/home'
  root 'pages#home'
  get 'about' => 'pages#about'
  resources :reviews
  resources :users, only: [:new, :create, :show, :update, :destroy]
  resources :hospitals
  resources :locations
  resources :healthsystems
  patch '/sessions/reset', to: 'sessions#reset_view_tracker'
  get '/signup', to: 'users#new', as: "signup"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
