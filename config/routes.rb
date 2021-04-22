Rails.application.routes.draw do
  root 'users#index'

  get '/sign-up', to: 'users#new'
  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy'

  resources :users

  resources :groups
  resources :groups do
    resources :gifts, only: %i[create new]
  end

  resources :gifts

end
