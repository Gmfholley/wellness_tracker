Rails.application.routes.draw do

  resources :rule_eaches
  resources :rule_totals
  resources :rule_qualifes
  
  resources :organizations do
    resources :challenges
  end
  
  get 'challenges/:token_id/sign_up' => 'challenge_participants#new', as: :challenge_sign_up
  post 'challenges/:token_id/participants' => 'challenge_participants#create'
  delete 'challenges/:token_id/participants' => 'challenge_participants#destroy', as: :challenge_participants
  get 'challenges/:token_id/participants' => 'challenge_participants#index'
  get 'challenges/:token_id' => 'challenge_participants#show', as: :challenge_not_found
  get 'teams/:token_id' => 'challenge_participants#team', as: :team_sign_up
  
  
  resources :friends, except: [:update, :edit, :create]
  post 'friends/new/:user_id' => 'friends#create', as: :add_friend
  
  #resources :exercise_types
  resources :exercise_events do
    resources :cheers, only: [:create]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  
  delete 'exercise_events/:exercise_event_id/cheers' => 'cheers#destroy'
  
  post 'password_resets' => 'password_resets#create', as: :password_resets
  get 'password_resets/:id/edit' => 'password_resets#edit', as: :edit_password_resets
  put 'password_resets/:id' => 'passwords_resets#update'
  patch 'password_resets/:id' => 'passwords_resets#update'



  get 'profile' => 'users#show', as: :profile
  get 'edit_profile' => 'users#edit', as: :edit_profile
  put 'edit_profile' => 'users#update' 
  patch 'edit_profile' => 'users#update'
  delete 'delete_profile' => 'users#destroy', as: :delete_profile
  get 'friends_feed' => 'friends_activities#index', as: :friends_feed 

  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'
  get 'users/:username' => 'friends#show', as: :user
  post 'login' => 'user_sessions#create', as: :login
  get 'login' => 'user_sessions#new'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  get '/' => 'users#show', as: :root
  
  
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
