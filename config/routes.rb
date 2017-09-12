require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'entries#index'
  resources :users, :entries, :pages
  scope '/manage' do
    mount Sidekiq::Web, at: "/sidekiq"
  end
end
