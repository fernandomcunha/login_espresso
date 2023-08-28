# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'
  }

  root to: 'home#index'
end
