Rails.application.routes.draw do
  get 'welcome/index'

  #match 'post/find', to: 'posts#find', via: [:get, :post]
  #post  'post/create' => 'posts#create'
  get  'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get  'post/:post_id', to: 'posts#find'
  # resources :posts do      
  # 	collection do
  #      get :find
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :articles
 
  root 'welcome#index'
 end
