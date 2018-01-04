Rails.application.routes.draw do

#admin's routes

  get 'logina' => 'sessionsa#new'
  post 'logina' => 'sessionsa#create'
  delete 'logouta' => 'sessionsa#destroy'
  post 'deny' => 'creationreports#deny'
  post 'confirm' => 'creationreports#confirm'
  post 'report' => 'micropostreports#create'
  post 'destroyuser' => 'admins#deleteuser'
  post 'destroymicropost' => 'admins#deletemicropost'
  get 'resetrequest' => 'admins#resetrequest'

#other routes

  post 'indexmarkets' => 'markets#indexmarkets'

  get 'indexmarkets' => 'markets#indexmarkets'
  
  post 'links_third/check' => 'links_third#check'

  post 'links_second/check' => 'links_second#check'
  
  post 'links/check' => 'links#check'

  get 'links/check'

  get 'smart_shopping/makelist'

  get 'smart_shopping/corefunction'

  post 'smart_shopping/makelist' => 'smart_shopping#makelist'

  post 'smart_shopping_cf' => 'smart_shopping#corefunction'

  get 'smart_shopping_cf' => 'smart_shopping#corefunction'

  root 'pages#homepage'

  #user's routes

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  #manager routes's

  get 'loginm' => 'sessionsm#new'

  post 'loginm' => 'sessionsm#create'

  delete 'logoutm' => 'sessionsm#destroy'

  #static_pages's routes

  get 'howto' => 'pages#howto'

  get 'help' => 'pages#help'

  #model's routes

  resources :markets

  resources :users

  resources :microposts, except: :index

  resources :requests

  resources :managers

  resources :owners

  resources :admins
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
