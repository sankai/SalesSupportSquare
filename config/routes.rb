Salessupportsquare::Application.routes.draw do

  get '/ankens/jchy_index' => 'ankens#jchy_index'
  
  resources :mailrecords

  resources :mailsents

  resources :mailtemplates

  root :to => 'menu#show'
  
  get 'uriys/by_bmn/:month/:e_bmn_id' => 'uriys#index'
  
  get 'urijs/by_bmn/:month/:e_bmn_id' => 'urijs#index'

  get 'uriys/by_shain/:month/:e_shain_id' => 'uriys#index'
  
  get 'urijs/by_shain/:month/:e_shain_id' => 'urijs#index'

  get 'uriys/shains_tobe_sent' => 'uriys#shains_tobe_sent'

  get 'uriys/bmns_tobe_sent' => 'uriys#bmns_tobe_sent'

  put 'uriys/send_to_shains' => 'uriys#send_to_shains'

  put 'uriys/send_to_bmns' => 'uriys#send_to_bmns'

  # post 'uriys/index' => 'uriys#index'

  post 'ankens/index' => 'ankens#index'

  get  'ankens/index/:page' => 'ankens#index'
  
  post 'ankens/upload' => 'ankens#upload'

  resources :urijs

  resources :uriys

  resources :uris

  resources :ankens

  resources :bmns

  resources :shains

  resources :endusers

  resources :kkks

  resources :uribunyas

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
