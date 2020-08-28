Rails.application.routes.draw do
  get 'home/about'
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index, :edit, :update ]
  resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy ]
end
