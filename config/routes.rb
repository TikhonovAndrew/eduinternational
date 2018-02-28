Rails.application.routes.draw do
  devise_for :team_members, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root to: "pages#index"
 resources :event_confirmations
 resources :events
  get '/events/:id/register', to: 'event_confirmations#new'
  post '/events/:id/register', to: 'event_confirmations#create'

resources :branches
resources :posts
resources :team_members
end
