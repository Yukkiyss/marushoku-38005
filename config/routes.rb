Rails.application.routes.draw do

  devise_for :users
  get 'stores/index'
  root to: 'stores#index'

  resources :stores, only: [:index, :new, :create, :show]

end
