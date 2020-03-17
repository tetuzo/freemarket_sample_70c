Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:index, :show]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :posts, only: [:new, :create, :show]

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  # 商品購入機能はpostではなくitemコントローラーで
  resources :items, only: [:new, :create, :show]
end
