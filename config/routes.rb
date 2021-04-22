Rails.application.routes.draw do
  get '/sign-up', to: 'users#new'
  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy'
end
