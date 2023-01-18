Rails.application.routes.draw do

  #devise_for :admins
  #devise_for :admins

 # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/users/registrations",
  sessions: 'public/users/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'

  #ゲストログイン
  devise_scope :user do
    post 'public/users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end


  namespace :admin do

    get 'homes/top'

    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    patch '/users/:id/restore' => 'users#restore', as: 'restore'
  end

  namespace :public do
    resources :favorites, only: [:create, :destroy]

    get 'users/unsubscride' => 'users#unsubscride', as: 'unsubscride'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'

    resources :users, only: [:show, :edit, :update, :withdraw]
    resources :items, only: [:index, :show, :new, :destroy, :create, :edit, :update, :search] do
    resources :comments, only: [:create, :destroy]
    end

  end

#実装終了するまで一応残しておく※終了後削除する

  # #namespace :admin do
  #   get 'sessions/new'
  #   get 'sessions/create'
  #   get 'sessions/destroy'
  # end

  #   # get 'items/index'
  #   # get 'items/new'
  #   # get 'items/create'
  #   # get 'items/show'
  #   # get 'items/edit'
  #   # get 'items/update'
  # end

  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/create'
  #   get 'genres/edit'
  #   get 'genres/update'
  # end

  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  # end

  # namespace :public do
  #   get 'favorites/create'
  #   get 'favorites/destroy'
  # end
  # namespace :public do
  #   get 'comments/create'
  #   get 'comments/destroy'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  #   get 'customers/unsubscride'
  #   get 'customers/withdraw'
  # end
  # namespace :public do
  #   get 'sessions/new'
  #   get 'sessions/create'
  #   get 'sessions/destroy'
  # end
  # namespace :public do
  #   get 'registrations/new'
  #   get 'registrations/create'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  #   get 'items/new'
  #   get 'items/destroy'
  #   get 'items/create'
  #   get 'items/edit'
  #   get 'items/update'
  #   get 'items/search'
  # end
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end