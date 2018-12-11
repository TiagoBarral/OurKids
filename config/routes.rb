Rails.application.routes.draw do
  root to: 'pages#landing'
  devise_for :users
  resources :families do
    resources :children
    resources :expenses
    resources :payments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
