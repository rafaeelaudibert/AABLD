# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  scope :dashboard do
    # General Resources
    resources :universities
    resources :cities do
      collection do
        get '/all', to: 'cities#all', as: 'all'
      end
    end
    resources :bus_companies
    resources :user_tickets, only: %i[create update destroy]
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
    get 'dashboard/user/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'dashboard/user', to: 'devise/registrations#update', as: 'user_registration'
  end
end
