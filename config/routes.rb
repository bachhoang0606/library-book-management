Rails.application.routes.draw do
  get 'home/new'
  get 'home/create'
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
  
  resources :readers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'home/', to: "home#index"
  root to: "home#index"
  # get '/reader/:email', to: 'reader#show'
end
