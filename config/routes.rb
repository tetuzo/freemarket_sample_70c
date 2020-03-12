Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:index]
  resources :card, only: [:new, :show, :create, :delete] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :posts, only: [:new, :create, :show]

end
