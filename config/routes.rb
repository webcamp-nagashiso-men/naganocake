Rails.application.routes.draw do
  
  
  
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # 管理者側のルーティング設定
  namespace :admin do
    resources :products
  end
  
  # 会員側のルーティング設定
  scope module: :public do
    get 'top'=>'homes#top'
    resources :product
  end

  
end
