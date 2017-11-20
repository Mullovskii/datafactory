Rails.application.routes.draw do
  resources :setups
  resources :settings
  resources :habbits
  resources :systems
  resources :traffics
  resources :companies
  resources :countries do
  	member do
    	get 'buys_from'
    	get 'internal_turnover'
    	get 'foreign_buyers'
  	end
  end
  resources :websites

  root :to => 'websites#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
