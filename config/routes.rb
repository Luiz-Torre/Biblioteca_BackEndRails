Rails.application.routes.draw do
  post '/login', to: 'authentication#login'
  post '/sign_up', to: 'authentication#sign_up'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end