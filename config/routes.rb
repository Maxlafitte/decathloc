Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :equipments do
    resources :bookings, except: [:destroy]
  end
  get 'dashboard/equipments', to: 'dashboards#my_equipments', as: :dashboard_equipments
  get 'dashboard/bookings', to: 'dashboards#my_bookings', as: :dashboard_bookings
  root to: 'equipments#index'
end
