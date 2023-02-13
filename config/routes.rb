Rails.application.routes.draw do
  resources :book_reviews
  resources :borrow_pays
  get 'home/new'
  get 'home/create'
  resources :readers
  resources :admins
  devise_for :admins
  resources :readers
  devise_for :readers, 
            controllers: {
              sessions: 'users/sessions',
              registration: 'users/registrations'
            },
            :path => ''
  #resources :readers
  resources :library_cards
  resources :books
  resources :publishers
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "borrow_pays#index"
  #get 'home/', to: "home#index"
  root to: "home#index"
  #get '/home', to: 'home#index'
end
