Rails.application.routes.draw do

  resources :pledges
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :campaigns, only: [:new, :create, :show, :edit, :destroy], shallow: true do
    resources :publishings, only: :create
    resources :pledges, only: :create do
      resources :payments, only: [:new, :create]
    end
  end

  resources :users, only: [:new, :create]
  resources :nearby_campaigns, only: :index
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'welcome#index'
end
