Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customers/:id', to: 'customers#show'
  post '/customers/:id', to: 'customers#show'

end
