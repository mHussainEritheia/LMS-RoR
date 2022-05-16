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

  # root "admin/book_categories#index"
  namespace :admin do
    resources :book_categories 
    resources :books 
    resources :requested_books
    resources :issuebooks
    resources :bookfines, except: [:create, :new, :edit, :show, :update, :destroy]
  end
  
  post "checkout/create", to: "checkout#create"

  namespace :reader do
    # root "admin/book_categories#index"
    get 'top_rated_books/index'
    # resources :book_categories, only: [:show, :index] 
    # get 'book_categories', to: '/books'
    resources :books, only: [:show, :index] 
    resources :bookfines, except: [:create, :new, :edit, :show, :update, :destroy]
    get 'bookfines/pay-dues', to: 'bookfines#pay_dues'
    resources :requested_books
    post 'requested_books/book-rating', to: 'requested_books#book_rating'
    get 'requested_books/return/:id', to: 'requested_books#return_book'
  end
end
