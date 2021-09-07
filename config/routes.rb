Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/search' => 'searches#search'
  get 'homes/about' => 'homes#about'
  resources :books do
  resources :post_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update] do

  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end
end