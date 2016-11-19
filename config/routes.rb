Rails.application.routes.draw do
  resources :line_items
  resources :receipts
  devise_for :users

  resources :users, except: :create
  resources :patients, only: [:index, :create], controller: 'users'

  root to: "application#index"
end

