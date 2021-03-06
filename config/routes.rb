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

  resources :purchase, only: [:show] do
    collection do
      post 'pay/:id', to: 'purchase#pay'
      post '/:id', to: 'purchase#pay' 
      get 'done/:id', to: 'purchase#done', as: :done
    end
  end  

  namespace :items do
    resources :searches, only: :index
  end

  resources :items do
    collection do
      get 'search_child', defaults: { format: 'json' }
      get 'search_grandchild', defaults: { format: 'json' }
      get 'done', to: 'items#done', as: :done
    end
    member do
      patch 'buyer', to: 'items#buy'
      get 'buyer', to: 'items#buy'
    end
  end
  
end
