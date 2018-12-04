Rails.application.routes.draw do

  resources :mods
  mount EpiCas::Engine, at: "/"
  devise_for :users
  get 'welcome/index'
<<<<<<< HEAD
  resources :requirements
  resources :users
=======
  resources :requirements do
    member do
      get :accept
      get :decline
    end
  end
>>>>>>> 09fc865305eb52e79a89499c78e032d96dfb1241
  root 'welcome#index'
  # root 'requirements#index'
  # resources :requirements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
