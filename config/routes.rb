Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

 # get 'spa/index'

  root "welcomes#index"
  resources :producers
  resources :products
  resources :users
  resources :categories

    # get "/hello/:name" => "welcome#hello", as: "hello_person"

  get "/about" => "about#index"

    # get is a method that takes it a single argument which is a hash. So the
    # explicit format for it is:
  get({"/contact" => "contact#index"})

  post "/contact" => "contact#create"
    # match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

    resources :newsletter_mailer
    resources :products, only: [] do
      # resources :comments
      resources :favourites, only: [:create, :destroy]
      resources :reviews, only: [:create, :destroy]
      resources :cancellings, only: [:create]
    end

    resources :categories, only: [:show]


    resources :users, except: [:edit, :update] do
      # this will give a URL /users/edit because we don't need the id of the user
      # in the URL because we have it in the session. In addition, it could pose
      # a security risk to have the user id part of the URL
      # as: :collection option makes it not include :id in the URL
      get :edit, on: :collection

      patch :update, on: :collection

    end

    resources :sessions, only: [:new, :create] do
      # this will make the destry action not requie an id so we can access
      # the destroy action with sessions_path or /sessions without passing an id
      delete :destroy, on: :collection
    end



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
