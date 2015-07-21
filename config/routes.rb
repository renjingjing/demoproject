Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

    root "welcomes#index"
    resources :producers, only: [:index,:show]
    resources :users
    resources :carts
      # get "/hello/:name" => "welcome#hello", as: "hello_person"

    get "/about" => "about#index"

      # get is a method that takes it a single argument which is a hash. So the
      # explicit format for it is:
    get({"/contact" => "contact#index"})

    post "/contact" => "contact#create"
      # match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

    resources :newsletter_mailer
    resources :products do
      # resources :comments
      resources :favourites, only: [:create, :destroy]
      resources :reviews, only: [:create, :destroy]
      resources :cancellings, only: [:create]
      # resources :payments, only: [:new, :create]
      resources :paynows, only: [:create]
    end

    resources :paynows, only: [] do
    resources :payments, only: [:new, :create]
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

end
