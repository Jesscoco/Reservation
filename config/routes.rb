Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :materials
  resources :salles
  resources :plannings
  devise_for :users
  get '/reserved/:id', to: "salles#reserved", as: "reserved_salles"

  root 'plannings#index'
end
