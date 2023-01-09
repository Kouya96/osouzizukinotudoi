Rails.application.routes.draw do
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscride'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/destroy'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/search'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
