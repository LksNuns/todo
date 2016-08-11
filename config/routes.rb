Rails.application.routes.draw do
  root "home#index"


  namespace :dashboard do
    resources :todo_lists, only: [ :index, :new, :create ]
  end
end
