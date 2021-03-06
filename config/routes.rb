Rails.application.routes.draw do

  root 'sessions#new'

  resource :session, only: [:new, :create, :destroy]

  resource :query

  resources :cases, only: [:index, :show, :new, :create, :edit, :update] do

    get :archive, on: :collection

    resource :closure, only: [:new, :create]

    resources :involvements, only: [:index, :new, :create, :destroy]
    resources :follow_ups, only: [:new, :create]
    resources :links, only: [:create, :destroy]

  end

  resources :organizations, only: [:index, :show, :new, :create, :edit, :update]

  resources :people, only: [:index, :show, :new, :create, :edit, :update]

  resources :tags, only: [:index]

  namespace :my do

    resource :account, only: [:show, :edit, :update]

  end

  namespace :admin do

    resources :cases, only: [:index, :show] do
      member do
        get :reassign
        patch :update_assignment
        put :reopen
      end
    end

    resources :reports, only: [] do
      get :days_off, on: :collection
    end

    resources :users, only: [:index, :show, :new, :create, :edit, :update] do
      put :activate, :deactivate, on: :member
    end

    resources :tags, only: [:index, :new, :create, :edit, :update]

    resources :audit_trails, only: [:index]

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
