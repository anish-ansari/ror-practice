Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # route for signup page
  get "/signup", to: "users#new"
  resources :users

  # routes for login and logout
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # adding a resource called articles
  resources :articles do
    # adding a sub resource comments, since comment belongs_to articles
    resources :comments
  end
  # Defines the root path route ("/")
  root "welcome#index"
  # OR
  # get "/", to: "welcome#index"
  # OR
  # get "", to: "welcome#index"
  # OR
  # root to:"welcome#index"

end
