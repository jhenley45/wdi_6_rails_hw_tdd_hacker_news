HackerNews::Application.routes.draw do

  # get "users/index"
  # get "users/show"
  # get "users/new"
  # get "users/create"
  devise_for :users
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end


 end
