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
    get '/payments/pay', to: 'payments#pay'
    post '/payments/pay', to: 'payments#stripe'
  end
  resources :expenses, only: [:index, :new, :create]
end
