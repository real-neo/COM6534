Rails.application.routes.draw do

  resources :mods
  mount EpiCas::Engine, at: "/"
  devise_for :users
  resources :requirements do
    member do
      get :accept
      get :decline
    end
  end
  resources :users
  resources :records
  root 'welcome#index'
  # root 'requirements#index'
  # resources :requirements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
