# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cities
  root to: 'welcome#index'

  ## Devise Views
  devise_scope :user do
    # custom path to login/sign_in to sign_up/registration
    get '/sign_in', to: 'devise/sessions#new'
    get '/sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
  end

  devise_for :users, skip: %i[registrations]
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users', to: 'devise/registrations#update', as: 'user_registration'
  end
end
