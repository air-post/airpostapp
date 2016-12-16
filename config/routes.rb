Rails.application.routes.draw do
  get 'welcome/index'
  namespace :api do
    #match 'post/find', to: 'posts#find', via: [:get, :post]
    #post  'post/create' => 'posts#create'
    post 'login' => 'users#login'
    post 'users' => 'users#create'
    get  'users/token' => 'users#token'
    get  'users/:id/', to: 'users#index'
    get  'user' => 'users#index'

    resources :posts do
      collection do
        get :find
      end
    end

    # get  'posts' => 'posts#index'
    # post 'posts' => 'posts#create'
    # get  'post/:post_id', to: 'posts#find'
    # resources :posts do      
    # 	collection do
    #      get :find
    #   end
    # end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #resources :articles
  end 
  root 'welcome#index'
 end
