SovpokAuth::Application.routes.draw do
  get "profiles/edit"
  put "profiles/update"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions",:omniauth_callbacks => "omniauth_callbacks"}
  resources :users, :profiles
end