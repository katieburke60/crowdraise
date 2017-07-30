Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'campaigns#index'
  resources :users, only: [:new, :create, :show]
  resources :campaigns, only: [:new, :create, :index, :show] do
    resources :fundings
  end

  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  # get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #create accounts
  post '/connect/new' => 'stripe#new', as: 'stripe_new'


  resources :accounts
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout', to: 'sessions#destroy'


end
