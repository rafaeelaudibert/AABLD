# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  scope :dashboard do
    # General Resources
    resources :universities
    resources :cities
    resources :bus_companies
    resources :user_tickets
    resources :transactions
    resources :tickets
  end

  ## Devise Views
  # devise_scope :user do
  #   get '/sign_in', to: 'devise/sessions#new' # custom path to login/sign_in
  # end

  devise_for :users, skip: %i[registrations],
                     controllers: { sessions: 'users/sessions',
                                    passwords: 'users/passwords',
                                    invitations: 'users/invitations' }
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users', to: 'devise/registrations#update', as: 'user_registration'
  end
end
