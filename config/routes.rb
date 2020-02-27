Rails.application.routes.draw do
  post   '/like/:story_id' => 'likes#like',   as: 'like'
  delete '/like/:story_id' => 'likes#unlike', as: 'unlike'
  devise_for :users, controllers: { registrations: 'registrations' } 
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show,:edit,:update]
  resources :likes, only: [:create, :destroy]
  resources :pets, only: [:index,:new,:create,:show,:destroy]
end
