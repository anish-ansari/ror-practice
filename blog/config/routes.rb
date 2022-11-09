Rails.application.routes.draw do
  get "welcome/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

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
