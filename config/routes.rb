HackerNews::Application.routes.draw do

  # get "votes/create"
  # get "users/index"
  # get "users/:id" => 'users#show'
  # get "users/new"
  # get "users/create"
  devise_for :users
  resources :users
  root to: 'articles#index'

  resources :articles do
    resources :votes, defaults: {votable: 'article'}
    resources :comments do
      resources :votes, defaults: {votable: 'comment'}
    end
  end


 end
