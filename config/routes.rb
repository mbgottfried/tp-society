Monospace::Application.routes.draw do
  resources :orders

  mount StripeEvent::Engine => '/webhooks'
  root :to => "home#index"
  match 'register' => 'users#new', :as => :register
  match "sign_in" => "sessions#new", :as => :sign_in
  match "sign_out" => "sessions#destroy", :as => :sign_out
  match "edit_profile" => "users#edit", :as => :edit_profile
  match "cancel_account" => "users#destroy", :as => :cancel_account
  match "delete_account" => "users#bury", :as => :bury_account
  match "reactivate_account" => "users#reactivate_account", :as => "reactivate_account"
  match "charge_succeeded" => "webhooks#charge_succeeded", :as => "charge_succeeded"
  match "ship_order/:id/" => "orders#ship_order", :as => :ship_order
  match "unship_order/:id/" => "orders#unship_order", :as => :unship_order
  match "ship_all" => "orders#ship_all", :as => :ship_all

  resources :users
  resources :sessions
  resources :password_resets

  get "open_orders" => "orders#open_orders"
  get "goodbye" => "pages#goodbye"
  get "cancel" => "pages#cancel"
  get "reactivate" => "users#reactivate"
  get "terms" => "pages#terms"
  get "privacy" => "pages#privacy"
  get "feeding_america" => "pages#feeding_america"
  get "how_it_works" => "pages#how_it_works"

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
