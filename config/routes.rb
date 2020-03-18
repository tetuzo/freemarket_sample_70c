Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'personals', to: 'users/registrations#new_personal'
    post 'personals', to: 'users/registrations#create_personal'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
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
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  # 商品購入機能はpostではなくitemコントローラーで
  resources :items, only: [:new, :create, :show] do
    collection do
      get 'search_child', defaults: { format: 'json' }
      get 'search_grandchild', defaults: { format: 'json' }
    end
  end
end
