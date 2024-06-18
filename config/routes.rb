Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments
  resources :users, only: [:index, :show, :new, :create]

  delete '/logout', to: 'sessions#destroy'

  root "posts#index"
end
