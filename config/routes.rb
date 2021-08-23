Rails.application.routes.draw do



  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 管理者側のルーティング設定
  namespace :admin do
    resources :products
    resources :end_users
    resources :genres
    resources :orders
    resources :order_products
    get 'order_products/:id' => 'order_products#update'
  end


  devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new'
    post '/admins/sign_in' => 'admins/sessions#create'
    delete '/admins/sign_out' => 'admins/sessions#des'
  end


  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    get 'products' => 'products#index'
    get 'products/:id' => 'products#show'
    resources :products

    resources :end_users,only:[:show,:edit,:update] do
      member do
      get 'quit'
      patch 'out'
    end
    end

    resources :shipping_addresses

    resources :products
    resources :cart_products

    resources :orders,only:[:index,:new,:show,:create] do
      collection do
      post '/check' => 'orders#check'
      get 'complete'
    end
    end

  end


  get 'search/search'


end