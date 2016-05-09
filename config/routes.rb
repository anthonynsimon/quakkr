Rails.application.routes.draw do
  get 'profiles/show'

  root 'posts#index'
  
  devise_for :users, controllers: { registrations: 'registrations' }
  # resources :users, only: [:show]
  
  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'unlike'
    end
  end  
  
  # User profiles routes
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name', to: 'profiles#update'
  
  # Notification link through
  get 'notifications/:id', to: 'notifications#link_through', as: :link_through
end