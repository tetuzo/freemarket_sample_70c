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
  resources :card, only: [:new, :show, :create, :delete] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :posts, only: [:new, :create, :show]

end
