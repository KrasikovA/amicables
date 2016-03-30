Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'
  namespace 'api' do
    ##bands
    get 'bands', to: 'bands#all'
    get 'bands/back', to: 'bands#back'
    ##
    ##releases
    #get 'releases', to: 'bands#all_with_releases'
    get 'releases/back', to: 'releases#back'
    ##
    ##about
    get 'about/description', to: 'about#description'
    get 'about/back', to: 'about#back'
    ##
    ##home
    get 'home/back',to: 'home#back'
    ##
  end

  namespace 'admin' do
    get '/', to: redirect { "admin/about"}
    resources :bands
    post 'bands/back_image',to: 'back_images#bands_create'
    post 'about/back_image',to: 'back_images#about_create'
    post 'about/description', to: 'about#update_description'
    get 'about', to: 'about#index'
    get 'releases', to: 'releases#index'
    post 'releases/back_image',to: 'back_images#releases_create'
    get 'home', to: 'home#index'
    post 'home/back_image',to: 'back_images#home_create'
  end

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
