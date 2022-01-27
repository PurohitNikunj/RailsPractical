Rails.application.routes.draw do
  # get 'books/index'
  get '/books/new/:id', to: "books#new"
  get 'books/show'
  get 'books/edit/:id', to: "books#edit"

  root "products#index"
  resources :products
  resources :authors 
  resources :books

end
