Rails.application.routes.draw do
  get 'profiles/show'

  root 'posts#index'
  
  devise_for :users, controllers: { registrations: 'registrations' }
  # resources :users, only: [:show]
  
  resources :posts do
    resources :comments
  end  
  
  # User profiles routes
  get ':user_name', to: 'profiles#show', as: :profile
end
