Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:show,:index,:create,:edit,:update,:destroy]
  
  
  get 'home/about' => 'homes#about'
  
end