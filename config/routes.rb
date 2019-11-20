Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users
  resources :equipment
  resources :groups
  resources :users

  root to: "equipment#index"

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
