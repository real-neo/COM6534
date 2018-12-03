Rails.application.routes.draw do

  mount EpiCas::Engine, at: "/"
  devise_for :users
  get 'welcome/index'
  resources :requirements do
    member do
      get :accept
      get :decline
    end
  end
  root 'welcome#index'
  # root 'requirements#index'
  # resources :requirements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
