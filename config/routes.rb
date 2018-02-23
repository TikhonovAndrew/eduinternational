Rails.application.routes.draw do
  devise_for :team_members, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root to: "pages#index"
 resources :event_confirmations
 resources :events
  get '/events/:id/register', to: 'event_confirmations#new'
  post '/events/:id/register', to: 'event_confirmations#create'

 get '/baku' => 'pages#azeristudent'
 get '/kiev' => 'pages#studentstudy_kiev'
 get '/lviv' => 'pages#studentstudy_lviv'
 get '/odessa' => 'pages#studentstudy_odessa'
 get '/tbilisi' => 'pages#academicabroad'
 get '/tirana' => 'pages#studycare'
 get '/foundation' => 'pages#foundation'
end
