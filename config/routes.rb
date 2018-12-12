Rails.application.routes.draw do
  root to: 'pages#landing'
  devise_for :users
  post '/families/coparent', to: "families#coparent"
  get '/families/coparent', to: 'families#new_coparent'
  get '/dashboard', to: 'pages#dashboard'
  resources :families, only: [:index, :show, :new, :create] do
    resources :children, only: [:new, :create]
    resources :expenses
    resources :payments, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
