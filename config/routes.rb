Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :search_users
      get :search_skills
    end
  end

  resources :messages, only: [:new, :create, :index, :show] 


end
