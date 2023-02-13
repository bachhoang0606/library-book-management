Rails.application.routes.draw do
  get 'home/new'
  get 'home/create'
  devise_for :admins
  #get '/readers/list', to: "readers#index"
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
  #get 'home/', to: "home#index"
  root to: "home#index"

  #get '/home', to: 'home#index'
end
