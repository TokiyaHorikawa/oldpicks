Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, shallow: true do
    get 'search', on: :collection
    resources :comments, only: [:create, :edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :get_urls, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :follows, only: [:index, :create, :destroy]
    resources :followers, only: [:index]
  end
  post '/comments/:comment_id/like', to: 'likes#create', as: 'like'
  delete '/comments/:comment_id/unlike', to: 'likes#destroy', as: 'unlike'

end
