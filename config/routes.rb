Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, shallow: true do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :get_urls, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy]

  post '/comments/:comment_id/like', to: 'likes#create', as: 'like'
  delete '/comments/:comment_id/unlike', to: 'likes#destroy', as: 'unlike'
end
