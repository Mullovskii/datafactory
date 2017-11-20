Rails.application.routes.draw do
  resources :setups
  resources :settings
  resources :habbits
  resources :systems
  resources :traffics
  resources :companies
  resources :countries
  resources :websites

  root :to => 'websites#index'

  get 'indonesia', to: 'scrypt#indonesia'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
