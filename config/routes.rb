Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'

  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/products/sale', to: 'products#sale'
  get '/products/new', to: 'products#new'

  resources :cart, only: %i[create destroy]

  get "home/index"
  root "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers
  resources :products do
    collection do
      get 'search'
    end
  end
  resources :categories

end
