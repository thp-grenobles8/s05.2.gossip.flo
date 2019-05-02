Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root 'gossips#index'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :users
  resources :cities
  resources :gossips do
    resources :comments
  end
  resources :join_table_gossip_tags
  resources :sessions, only: [:new, :create, :destroy]
end
