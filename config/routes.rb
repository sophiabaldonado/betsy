Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'

  post '/products/:id' => 'products#create_cart', as: :create_cart
  post '/cart' => 'orders#update_cart'
  #post '/products/:id' => 'products#create_review', as: :create_review
  get '/checkout' => 'orders#new', as: :new_order
  post '/checkout' => 'orders#create'
  post '/checkout/:order_id' => 'orders#show'
  post '/browse' => 'products#index'
  get '/browse/categories/:id' => 'products#category', as: :category
  get '/sign_up' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  delete '/checkout' => 'orders#destroy'
  resources :products, only: [:index, :show]



  resources :products, only: [:index, :show] do
      resources :reviews, :only => [:new, :create]
  end

  resources :orders, except: [:new]

  get 'users/:user_id/sold/:order_id' => 'orders#show', as: :sold_order
  patch 'users/:user_id/sold' => 'orders#item_shipped'
  get 'users/:user_id/sold' => 'orders#index', as: :sold_orders


  resources :users do
    resources :products
    resources :orders
  end

  resources :billings do

  end



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
