Rails.application.routes.draw do
  resources :loans
  resources :books
  resources :authors
  post '/login', to: 'authentication#login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
