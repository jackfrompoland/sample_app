SampleApp::Application.routes.draw do
#wydaje mi sie, ze plik z routingiem jest uzywany przez serwer
#rails server -p 3001

resources :users #Recall from Section 7.1.2 that adding resources :users to the routes.rb file (Listing 7.3) automatically ensures that our Rails   
                 #application responds to the RESTful URIs from Table 7.1. In particular, it ensures that a POST request to /users is handled by the 
                 #create action. 

resources :sessions, only: [:new, :create, :destroy]

#To get the tests in Listing 8.1 to pass, we first need to define routes for the Sessions resource, 
#together with a custom named route for the signin page (which we’ll map to the Session controller’s new action). 
#As with the Users resource, we can use the resources method to define the standard RESTful routes:

#aby test udawal sie na zmienionych sciezkach routingu potrzebny jest restart "spork'a" albo nie uzywanie "spork'a"




root :to => 'static_pages#home' #to jak mi sie zdaje rutuje domyslna strone na sciezke "static_pages#home"


match '/static_pages/home', :to =>'static_pages#home'
match '/help',    :to => 'static_pages#help'
match '/about',   :to => 'static_pages#about'
match '/contact', :to =>'static_pages#contact'
match '/signup',  :to => 'users#new'
match '/signin',  :to => 'sessions#new'
match '/signout', :to => 'sessions#destroy', via: :delete
# "via: delete" indicates that it should be invoked using an HTTP DELETE request.

  #get "users/new"

  #root :to => 'static_pages#home'
  #match '/signup',  :to => 'users#new'

  #get "static_pages/help"
  #get "static_pages/about"
  #get "static_pages/contact"
  #get "static_pages/home"

  #get "static_pages/help"
  #get "static_pages/about"
  #get "static_pages/contact"
  #get "static_pages/home"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
