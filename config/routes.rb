Rails.application.routes.draw do
  resources :articles
  root 'home#index'
  namespace :stocks do
    resource :all_scrape, only: :update
    resources :scrape, only: :update
  end
  resources :stocks
end
