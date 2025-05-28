Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  resources :users
  resource :session
  resources :passwords, param: :token
  resources :products

  scope "(:locale)" do
    resources :orders
    resources :line_items
    resources :carts
    #get "store/index"

    # David NOTE: This just lets you use a GET route
    #root "store#index", as: "store_index"

    # David NOTE
    # Since we're specifying `via: :all` we can use any HTTP VERB
    # (GET, POST, etc ...) see:
    # https://guides.rubyonrails.org/routing.html#http-verb-constraints
    #
    # The above warns you about doing this so probably not a good
    # idea to do this in a real app unless we really need/want it
    # and the higher ups agree to it.
    #
    # That being said since this is just a read operation and we're
    # not doing any writes or anything destructive shhould be OK
    # even if this was a real world scenario I think.
    root "store#index", as: "store_index", via: :all
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
