Rails.application.routes.draw do
  # get 'user/:id', to: 'dynamic_page#show_user', as: 'user'
  root 'gossips#index'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :gossips
  resources :users
  resources :cities
  resources :comments
  # get 'gossip/:id', to: 'gossips#show', as: 'gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
