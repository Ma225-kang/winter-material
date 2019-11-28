Rails.application.routes.draw do
  devise_for :users
  root to: 'equipment#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reservations, only: [:index]
  resources :equipment, only: [:show] do
    resources :reservations, only: [:new, :create]
  end

  #pour que le owner voit ses equipements
  namespace :owner do
    resources :equipment, only: [:index, :new, :create, :destroy]
    resources :reservations, only: [:index] do
      member do
        patch 'accept'
        patch 'decline'
      end
    end
  end
  resources :users, only: [:edit, :update]

end
