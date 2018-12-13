
Rails.application.routes.draw do
  root to: 'pages#landing'
  devise_for :users
  post '/families/coparent', to: "families#coparent"
  get '/families/coparent', to: 'families#new_coparent'
  resources :families, only: [:index, :show, :new, :create] do
    resources :children, only: [:new, :create]
    resources :expenses
    resources :payments
  end

  resources :expenses, only: [:index, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
