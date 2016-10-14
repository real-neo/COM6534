Rails.application.routes.draw do

  mount EpiCas::Engine, at: "/"
  devise_for :accounts
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  namespace :students do
    resources :consumables, only: [:index] do
      resources :purchases, only: [:new, :create]
    end
  end

  namespace :staff do
    resources :consumables
    resources :purchases, only: :index
  end

  namespace :admin do
    resources :feature_toggles, only: [:index, :update]
  end

  authenticated :account, ->(user) { user.staff? } do
    root to: "staff/consumables#index", as: :staff_root
  end

  authenticated :account, ->(user) { user.student? } do
    root to: "students/consumables#index", as: :student_root
  end

  root to: "staff/consumables#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
