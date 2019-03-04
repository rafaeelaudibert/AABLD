# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_tickets
  resources :transactions
  resources :tickets
  root to: 'welcome#index'

  ## Devise Views
  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new' # custom path to login/sign_in
  end

  devise_for :users, skip: %i[registrations]
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users', to: 'devise/registrations#update', as: 'user_registration'
  end

  # Resources
  resources :universities
  resources :cities
  resources :bus_companies
end
