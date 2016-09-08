Rails.application.routes.draw do
  root to: 'rooms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users

  mount ActionCable.server => '/cable'
end
