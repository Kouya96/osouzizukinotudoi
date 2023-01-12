Rails.application.routes.draw do

  devise_for :admins
  #devise_for :admins

  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'

  devise_for :users

  namespace :admin do
    get 'homes/top'
  end

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :customers, only: [:show, :edit, :update, :unsubscride, :withdraw]
    resources :items, only: [:index, :show, :new, :destroy, :create, :edit, :update, :search]
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