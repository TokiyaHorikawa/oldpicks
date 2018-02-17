Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, shallow: true do
    resources :comments, only: [:create, :edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :get_urls, only: [:index]

  get '/user_ranking_page', to: 'ranking#user_ranking_page', as: 'user_ranking_page'
  get '/comment_ranking_page', to: 'ranking#comment_ranking_page', as: 'comment_ranking_page'
  get '/about_users', to: 'ranking#about_users', as: 'about_users'

  resources :users, only: [:show, :edit, :update, :destroy] do
    collection do
      get 'follow'
      get 'follower'
    end
  end
end
