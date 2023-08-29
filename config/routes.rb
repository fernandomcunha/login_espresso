# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'
  }

  resource :two_factor_settings, except: %i[index show]

  root to: 'home#index'
end
