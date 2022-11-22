require 'sidekiq/web'
Rails.application.routes.draw do
  authenticate :user, ->(u) { u.id } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :currencies, only: %i[index show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'currencies#index'
end
