Rails.application.routes.draw do
  scope module: 'developer' do
    resources :snippets do
      member do
        post :star
      end

      collection do
        get :stars
      end
      # post 'star', to: 'snippets#star'
    end

    get 'dashboard', to: 'dashboard#index'
    resources :users do
      resources :snippets
    end
  end

  # namespace :developer do
  #   get 'dashboard', to: 'dashboard#index'

  #   resources :snippets
  # end

  # ActiveAdmin.routes(self)
  # resources :snippets

  get 'auth/login', to: 'sessions#new'
  post 'auth/login', to: 'sessions#create'
  delete 'auth/logout', to: 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#callback'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users do
    collection do
      post :reset_api_key
    end
  end


  namespace :api, defaults: { format: :json } do
    resources :snippets
  end

  root to: "home#index"

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
