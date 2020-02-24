Rails.application.routes.draw do
  post   '/like/:story_id' => 'likes#like',   as: 'like'
  delete '/like/:story_id' => 'likes#unlike', as: 'unlike'
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: [:show,:edit,:update]
  resources :likes, only: [:create, :destroy]
  resources :pets, only: [:index]
end
