Rails.application.routes.draw do
  root to: 'rooms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users
  post '/rooms', to: 'rooms#create'
  get '/rooms/:id', to: 'rooms#show'
  delete '/logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  mount ActionCable.server => '/cable'
end
