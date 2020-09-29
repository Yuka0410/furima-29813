Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]  
  resources :purchases, only: [:create]#多分違うと思うので後で修正
end
