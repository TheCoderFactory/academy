Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # You can have the root of your site routed with "root"
  root "home#index"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  resources :academy_applications
  get "apply"         => "academy_applications#new"

  resources :enquiries
  get "enquire"       => "enquiries#new"

  resources :posts
  resources :info_session_attendees
  resources :info_session_dates
  get "information_sessions"   => "info_session_dates#index"

  get "faq"                       => "pages#faq"
  get "curriculum"                => "pages#curriculum"
  get "about"                     => "pages#about"
  get "contact"                   => "pages#contact"
  get "privacy"                   => "pages#privacy"
  get "community"                 => "pages#community"
  get "confirmation"              => "pages#confirmation"
  get 'vet-fee-help'              => "pages#vet_fee_help"
  get 'partners'                  => "pages#partners"

  get "blog"          => "blog#index"
  get "press"         => "press#index"

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
