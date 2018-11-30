Rails.application.routes.draw do

  root 'requirements#index'
  resources :requirements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
