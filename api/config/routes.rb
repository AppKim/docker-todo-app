# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: 'json' do
    resources :tasks, only: %i[index create update destroy]
    delete 'tasks' => 'tasks#destroy_all'
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
