Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
  resources :places, only: [:index, :new, :create]
  resources "posts"
  resources "sessions"
  resources "users"
end
