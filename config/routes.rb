Rails.application.routes.draw do
  resources :borrow_pays
  get 'home/new'
  get 'home/create'
  resources :readers
  resources :admins
  devise_for :admins
  devise_for :readers, controllers: {
    sessions: 'readers/sessions',
    registration: 'readers/registrations'
  }
  resources :library_cards
  resources :books
  resources :publishers
  resources :categories
  resources :authors
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "borrow_pays#index"
  #get 'home/', to: "home#index"
  # get '/reader/:email', to: 'reader#show'
end
