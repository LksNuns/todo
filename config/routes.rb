Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  namespace :dashboard do
    resources :todo_lists
    resources :public_todos, only: [ :index ]
    resources :favorite_todos, only: [ :index, :create, :destroy ]
  end
end
