Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post '/speech' => 'speech#conversation'

  root 'speech#index'
end
