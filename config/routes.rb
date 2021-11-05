Rails.application.routes.draw do
  resources :weights
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root 'pages#home'
  

  resources :weights, only: [:new, :create, :update, :destroy]

  # get "pages/weight_form" => 'pages#dashboard', :as => :weight_form

  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end
  
  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end


end
