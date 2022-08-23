Rails.application.routes.draw do
  #get 'home/index'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :logins
    resources :users
    resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  end
end