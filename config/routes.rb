Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :equipments do
    resources :bookings, except: [:destroy]
  end
  get 'dashboard', to: 'dashboards#my_equipments', as: :dashboard
  root to: 'equipments#index'
end
