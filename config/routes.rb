Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: [:show, :edit, :update]
  
  resource :slack
  
  resources :posts do
  	  resources :reactions
      resources :likes
  end

  resources :comments
  resources :search 
  
  root to: "hello#index"
end
