Rails.application.routes.draw do
  resources :inventories
  resources :inform_infecteds
  root :to => 'home#index'
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
