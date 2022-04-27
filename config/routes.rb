Rails.application.routes.draw do
  # get 'requested_books/index'
  # get 'requested_books/show'
  # get 'requested_books/requestBook'
  # get "/assets/add_jquery"
  # get "/assets/controllers/add_jquery"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/", to: "/users/sign_in"

  root "admin/book_categories#index"
  namespace :admin do
    resources :book_categories 
    resources :books 
    resources :requested_books
  end

  namespace :reader do
    resources :book_categories, only: [:show, :index] 
    resources :books, only: [:show, :index] 
    resources :requested_books
  end
end
