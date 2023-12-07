Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
   # なぜ上はusersなのに下はadminなのか？
  
  namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  resources :posts, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  end

  
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
  scope module: :public do
  root 'homes#top'
  get 'users/mypage' => 'users#show', as: 'mypage'
  # users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
  get 'users/information/edit' => 'users#edit', as: 'edit_information'
  patch 'users/information' => 'users#update', as: 'update_information'
  get 'users/chcek' => 'users#chcek', as: 'chcek'
  put 'users/information' => 'users#update'
  patch 'users/withdraw' => 'users#withdraw' , as: 'withdraw'
  
  
  resources :genres, only: [:show]
  resources :comment, only: [:create, :destroy]
  resources :posts
  
  end
end
