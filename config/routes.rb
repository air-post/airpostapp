Rails.application.routes.draw do
  get 'welcome/index'

  match 'post/find', to: 'posts#find', via: [:get, :post]

  post  'post/create' => 'posts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :articles
 
  root 'welcome#index'
 end
