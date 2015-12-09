Rails.application.routes.draw do

  root :to => 'users#new'
  post '/users' => 'users#create'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/profile', to: "users#show", as: 'user'
  get '/admin/profile', to: "users#show", as: "admin"

  get '/edits' => 'edits#index'
  get '/index' => 'index#index'
  get '/index/next' => 'index#next'
  get '/index/prev' => 'index#prev'

  get '/edits/show' => 'edits#show'
  patch '/edit' => 'edits#update'
  delete '/edit' => 'edits#destroy', as: "delete_edit"

  get '/articles/:id' => 'articles#show'
  get '/edits/new' => 'edits#new'
  get '/users/:id/edit' => 'users#edit'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy', as: 'destroy_user'
  # get '/edits/new' => 'edits#new'

  resources :categories do
    resources :articles do
      resources :edits
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
