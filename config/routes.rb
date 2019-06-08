Rails.application.routes.draw do
  # Custom Place routes
  resources :places, only: %i[new]
  get 'places/:category', to: 'places#index', as: :places_by_category, constraints: { category: /[a-z]+/ }
  resources :places, only: %i[create index show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
end
