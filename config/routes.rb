Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  
  root 'posts#index'

  resources :posts do
    resources :comments
  end  
end
