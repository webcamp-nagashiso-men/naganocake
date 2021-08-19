Rails.application.routes.draw do



  namespace :public do
    get 'shipping_addresses/index'
  end

  namespace :public do
    get 'shipping_addresses/create'
  end

  namespace :public do
    get 'shipping_addresses/destroy'
  end

  namespace :public do
    get 'shipping_addresses/edit'
  end

  namespace :public do
    get 'shipping_addresses/update'
  end

  get 'search/search'
devise_for :admins, skip: [:sessions]
  devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new'
    post '/admins/sign_in' => 'admins/sessions#create'
    delete '/admins/sign_out' => 'admins/sessions#des'
  end

  devise_for :end_users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理者側のルーティング設定
  namespace :admin do
    resources :products
  end

  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'products' => 'products#index'
    get 'products' => 'products#show'
    resources :product
    
    resources :end_users,only:[:show,:edit,:update] do
      member do
      get 'quit' 
      patch 'out' 
    end
    end
    
    resources :shipping_addresses
  end


end