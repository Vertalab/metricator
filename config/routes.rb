Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :integrations do
    get 'intercom', on: :collection
    resources :metrics do
      post :reload, on: :collection
    end

  end

  get '/auth/:provider/callback', to: 'integrations#intercom'


end
