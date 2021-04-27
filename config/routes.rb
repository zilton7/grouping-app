Rails.application.routes.draw do
  root 'users#index'

  get '/sign-up', to: 'users#new'
  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy'

  resources :users, only: %i[index new create show]

  resources :groups, only: %i[index new create show]
  resources :groups do
    resources :gifts, only: %i[create new]
  end

  resources :gifts, only: %i[index new create show]

end
