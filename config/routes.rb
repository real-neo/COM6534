Rails.application.routes.draw do

  resources :mods
  mount EpiCas::Engine, at: "/"
  devise_for :users
  get 'welcome/index'
  resources :requirements
  resources :users
  root 'welcome#index'
  # root 'requirements#index'
  # resources :requirements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
