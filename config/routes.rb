Rails.application.routes.draw do
  resources :book_reviews
  resources :borrow_pays
  get 'home/new'
  get 'home/create'
  resources :readers
  get 'admins/show'
  devise_for :admins
<<<<<<< HEAD
   
=======
  #get '/readers/list', to: "readers#index"
  resources :readers
>>>>>>> origin/master
  devise_for :readers, 
            controllers: {
              sessions: 'readers/sessions',
              registration: 'readers/registrations'
            },
            :path => ''
  
  resources :library_cards
  resources :books
  resources :publishers
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "borrow_pays#index"
  #get 'home/', to: "home#index"
<<<<<<< HEAD
  get '/home', to: 'home#index'
=======
  root to: "home#index"
  #get '/home', to: 'home#index'
>>>>>>> origin/master
end
