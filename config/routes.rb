Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'campaigns#index'
  resources :users, only: [:new, :create, :show]
  resources :campaigns, only: [:new, :create, :index, :show] do
    resources :fundings
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout', to: 'sessions#destroy'


end
