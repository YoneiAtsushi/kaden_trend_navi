Rails.application.routes.draw do
  
  
  
  
  
  
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/update'
    get 'genres/edit'
  end
  namespace :public do
    get 'genres/show'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/destroy'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/index'
    get 'posts/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/chcek'
    get 'users/withdraw'
  end
  namespace :public do
    get 'homes/top'
    
    
    
    
  end
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  # なぜ上はusersなのに下はadminなのか？
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
 
end
