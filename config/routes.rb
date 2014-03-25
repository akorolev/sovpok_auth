SovpokAuth::Application.routes.draw do
  resources :lots

  resources :addresses
  resources :categories, :except => [:show]
  get "/categories/*category" => "categories#show"

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions",:omniauth_callbacks => "omniauth_callbacks"}
  resources :users
  get "profiles/edit"
  put "profiles/update"
#  resources :profiles, :only => [:edit]
end