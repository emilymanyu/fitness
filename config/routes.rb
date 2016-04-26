 Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :feedbacks
  resources :courses do
  resources :comments
end
  resources :plans do
    resources :suggestions
  end
  resources :requests do
    resources :suggestions
  end
  resources :requests
          resources :users
          resources :microposts, only: [:create, :destroy, :index, :show] do
            resources :reviews, except: [:show, :index]
          end
          resources :sessions, only: [:new, :create, :destroy]
          resources :microposts, only: [:create, :destroy, :index, :show]

          root 'static_pages#home'

          get 'help'    => 'static_pages#help'
          get 'request'    => 'static_pages#request'
          get 'about'   => 'static_pages#about'
          get 'contact' => 'static_pages#contact'

          get 'signup'  => 'users#new'
          get    'login'   => 'sessions#new'
          post   'login'   => 'sessions#create'
          delete 'logout'  => 'sessions#destroy'
          get 'auth/:provider/callback', to: "sessions#thirdpart"
          get'videos' => 'static_pages#videos'
          get'video01' => 'static_pages#video01'
          get'video02' => 'static_pages#video02'
          get'video03' => 'static_pages#video03'
          get'video04' => 'static_pages#video04'
          get'video05' => 'static_pages#video05'

          get  'm_get_all_posts'  => 'microposts#m_get_all_microposts'
          post 'm_register'       => 'users#m_register'
          post 'm_login'          => 'sessions#m_login'
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
