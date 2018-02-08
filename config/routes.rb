Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, shallow: true do
    resources :comments, only: [:create, :edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :get_urls, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy]
end
