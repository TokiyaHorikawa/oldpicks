Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles, shallow: true do
    get 'search', on: :collection
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :get_urls, only: [:index]

  get '/user_ranking_page', to: 'ranking#user_ranking_page', as: 'user_ranking_page'
  get '/comment_ranking_page', to: 'ranking#comment_ranking_page', as: 'comment_ranking_page'
  get '/about_users', to: 'ranking#about_users', as: 'about_users'

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :follows, only: [:index, :create, :destroy]
    resources :followers, only: [:index]
    resources :questions, only: [:index, :show, :create, :update, :destroy]
  end

  post '/comments/:comment_id/like', to: 'likes#create', as: 'like'
  delete '/comments/:comment_id/unlike', to: 'likes#destroy', as: 'unlike'

  post '/users/:user_id/questions/:question_id/answer', to: 'answer#create', as: 'answer'

  #フィールド以下（分野別記事）
  get 'technology', to: 'fields#technology', as: 'technology'
  get 'business', to: 'fields#business', as: 'business'
  get 'economy', to: 'fields#economy', as: 'economy'
  get 'finance', to: 'fields#finance', as: 'finance'
  get 'career', to: 'fields#career', as: 'career'
  get 'society', to: 'fields#society', as: 'society'
  get 'job', to: 'fields#job', as: 'job'
end
