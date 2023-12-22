Rails.application.routes.draw do

  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
  get 'top' => 'homes#top', as: 'top'
  resources :posts, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :comments, only: [:destroy]
  end


# 　ユーザー側
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
  root 'homes#top'

  resources :users, only: [] do
    get 'mypage' => 'users#show', as: 'mypage'
  end
  # users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
  get 'users/information/edit' => 'users#edit', as: 'edit_information'
  patch 'users/information' => 'users#update', as: 'update_information'
  get 'users/chcek' => 'users#chcek', as: 'chcek'
  patch 'users/withdraw' => 'users#withdraw' , as: 'withdraw'


  resources :genres, only: [:show]
  resources :posts do
  resources :comments, only: [:create, :destroy]
  resource :favorite, only: [:create, :destroy]
  end

  end
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
end
