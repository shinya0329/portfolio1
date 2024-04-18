Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get '/categorys', to: 'posts#categorys'
  resources :users, only: [:index, :show, :edit, :update]
  
  get 'posts/category/:category', to: 'posts#category'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
