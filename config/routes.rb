Rails.application.routes.draw do
  root to: 'rooms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users
  post '/rooms', to: 'rooms#create'
  put '/rooms/:id', to: 'rooms#show'

  mount ActionCable.server => '/cable'
end
