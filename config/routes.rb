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
    patch 'requested_books/rejected/:id', to: 'requested_books#admin_rejected_book'
    resources :requested_books
    resources :issuebooks
    resources :bookfines, except: [:create, :new, :edit, :show, :update, :destroy]
  end

  namespace :reader do
    resources :book_categories, only: [:show, :index] 
    resources :books, only: [:show, :index] 
    resources :requested_books
    patch 'requested_books/return/:id', to: 'requested_books#return_book'
  end
end
