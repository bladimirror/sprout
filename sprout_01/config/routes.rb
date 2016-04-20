Rails.application.routes.draw do
  get 'itinerary/index'

  get 'event/Index'

#PRODUCT ROUTES
  get "/all_products" => 'product#all_products'

  get "/buy_product" => 'product#buy_product'

  get "/new_product" => 'product#new_product'

  post "/add_product_db" => 'product#add_product_db'

  post "/update_product" => 'product#update_product'

  get "/show_product" => 'product#show_product'

  get "/delete_product" => 'product#delete_product'

#USER ROUTES
  get "/" => 'user#index'

  post "/new_user" => 'user#new_user'

  post "/login_user" => 'user#login_user'

  get "/user_dashboard" => 'user#user_dashboard'

  post "/update_user_db" => 'product#update_user_db'

  get "/logout" => 'user#logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
