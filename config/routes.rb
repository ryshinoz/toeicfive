Toeicfive::Application.routes.draw do

  get "english/index"
  #facebook login 
  get "/login"  => "sessions#new"
  get "/logout" => "sessions#destroy"
  post "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#failuer"

  resources :examination do
    collection do
      get 'today_word'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #error pages
  get "error/500"
  get "error/404"
  get "error/examination_error"

  # You can have the root of your site routed with "root"
  root 'english#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  match '*a', :to => 'error#routing', :via => [:get]
end
