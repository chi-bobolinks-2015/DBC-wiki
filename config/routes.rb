Rails.application.routes.draw do

  root :to => 'users#new'
  post '/users' => 'users#create'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
