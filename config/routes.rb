Rails.application.routes.draw do
  devise_for :users
  get "/", to: "home#index"
  namespace :admin do
    resources :book_categories 
    resources :books 
    resources :requested_books
    resources :issuebooks
    resources :bookfines, except: [:create, :new, :edit, :show, :update, :destroy]
  end
  post "checkout/create", to: "checkout#create"
  namespace :reader do
    get 'top_rated_books/index'
    resources :books, only: [:show, :index] 
    resources :bookfines, except: [:create, :new, :edit, :show, :update, :destroy]
    get 'bookfines/pay-dues', to: 'bookfines#pay_dues'
    resources :requested_books
    post 'requested_books/book-rating', to: 'requested_books#book_rating'
    get 'requested_books/return/:id', to: 'requested_books#return_book'
  end
end