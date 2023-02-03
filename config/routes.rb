Rails.application.routes.draw do
  resources :borrow_pays
  devise_for :admins
  devise_for :readers
  resources :library_cards
  resources :books
  resources :publishers
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "borrow_pays#index"
end
