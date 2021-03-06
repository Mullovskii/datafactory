Rails.application.routes.draw do
  devise_for :users
  resources :inflows
  resources :setups
  resources :settings
  resources :habbits
  resources :systems
  resources :traffics
  resources :companies
  resources :countries do
  	member do
    	get 'buys_from'
      get 'buys_from_countries'
    	get 'internal_turnover'
    	get 'foreign_buyers'
      get 'payment_systems'
  	end
  end
  resources :websites

  root :to => 'websites#index'
  get 'indonesia', to: 'scrypt#indonesia'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
