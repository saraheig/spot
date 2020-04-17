Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Custom Place routes
  resources :places, only: %i[new]
  get 'places/:category', to: 'places#index', as: :places_by_category, constraints: { category: /[a-z]+/ }
  resources :places, only: %i[create index show]
  resources :languages, only: %i[create new]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'places#index'
end
