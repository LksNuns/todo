Rails.application.routes.draw do
  devise_for :users
  root "home#index"


  namespace :dashboard do
    resources :todo_lists, only: [ :index, :new, :create ]
  end
end
