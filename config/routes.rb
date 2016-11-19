Rails.application.routes.draw do
  devise_for :users

  resources :users, except: :create do
    resources :receipts, except: :index, shallow: true
  end


  resources :patients, only: [:index, :create], controller: 'users'

  root to: "application#index"
end

