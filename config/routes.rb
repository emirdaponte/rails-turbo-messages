# frozen_string_literal: true

Rails.application.routes.draw do
  root 'messages#home'

  resources :messages
end
