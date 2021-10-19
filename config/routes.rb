Rails.application.routes.draw do
  resources :users, only: :create
  get 'openapi.yaml', to: 'schema#openapi'
  get 'rapidoc.html', to: 'schema#rapidoc'
end
