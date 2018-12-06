Rails.application.routes.draw do

  resources :mods
  mount EpiCas::Engine, at: "/"
  devise_for :users
  resources :requirements do
    member do
      get :accept
      get :decline
    end
    collection do
      get :not_found
    end
  end
  resources :users
  resources :records
  get 'dashboard', to: 'records#read_records'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
