Rails.application.routes.draw do

  # get 'books/index'
  # get '/books/new/:id', to: "books#new"
  # get 'books/show'
  # get 'books/edit/:id', to: "books#edit"

  get '/terms', to: "students#terms"

  # root "products#index"
  # resources :products
  # resources :authors 
  # resources :books
  resources :students
  resources :faculties

  # Defines the root path route ("/")
  # root "articles#index"
end
