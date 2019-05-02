Rails.application.routes.draw do
  root 'gossips#index'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :users, only: [:new, :create, :show]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments, only: [:create, :destroy, :update, :edit]
    resources :likes, only: [:create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
