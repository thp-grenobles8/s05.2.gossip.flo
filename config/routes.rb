Rails.application.routes.draw do
  get 'user/:id', to: 'dynamic_page#show_user', as: 'user'
  get 'gossip/:id', to: 'dynamic_page#show_gossip', as: 'gossip'
  root 'static_pages#home'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
