Rails.application.routes.draw do
  devise_for :logins
  resources :users
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
