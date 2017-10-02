require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'entries#index'
  get 'rss' => 'rss#index'
  resources :users, :entries, :pages
  constraints subdomain: 'manage' do
    mount Sidekiq::Web, at: "/sidekiq"
  end
end
