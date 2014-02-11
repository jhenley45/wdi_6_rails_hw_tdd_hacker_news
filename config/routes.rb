HackerNews::Application.routes.draw do

  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  devise_for :users
  root to: 'users#index'

 end
