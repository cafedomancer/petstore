Rails.application.routes.draw do
  get 'openapi.yaml', to: 'schema#openapi'
  get 'rapidoc.html', to: 'schema#rapidoc'
end
