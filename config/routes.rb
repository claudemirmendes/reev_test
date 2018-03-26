Rails.application.routes.draw do
  get 'reports/generate_reports'

  resources :inventories
  resources :items, only: [:index]
  resources :inform_infecteds
  root :to => 'home#index'
  resources :survivors
  post 'exchanged', to: 'items#create_exchanged', as: 'exchanged'
  get 'reports', to: 'reports#generate_reports', as: 'reports'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
