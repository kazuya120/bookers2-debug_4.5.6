Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites,only: [:create, :destroy]
     resources :book_comments,only: [:create, :destroy]
   end

    resources :users,only: [:show,:index,:edit,:update] do
     resource :relationships,only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'home/about' => 'homes#about'
  get 'searches/search'

end