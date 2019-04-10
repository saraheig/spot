Rails.application.routes.draw do
  # Custom Place routes
  resources :places, only: %i[index new create show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
  # Default route (if unknown url)
  match '*path' => redirect('/places'), via: [:get, :post]

end
