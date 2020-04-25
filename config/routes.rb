Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users,only: [:show]
  resources :users,only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end
  root 'front#index'
   resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "buy"
    end
   end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
