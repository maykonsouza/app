Rails.application.routes.draw do
  devise_for :hosts
  #get 'control_users/index'
  get 'admin', to: 'control_users#index'
  root 'hosts#index'
  
  devise_for :users
  get 'hosts/run'
  get 'hosts/list'
  resources :hosts
  get 'welcome', to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
