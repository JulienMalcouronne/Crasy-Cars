Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [ :index, :new, :create, :show, :destroy, :edit, :update ] do
    resources :reservations, only: [:new, :create, :show]
    collection do
      get :search
    end
  end
  resources :reservations, only: [:destroy]
  get "/dashboard", to: "pages#dashboard"
end
