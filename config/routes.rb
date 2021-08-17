Rails.application.routes.draw do
  #devise_for :customers

  root to: 'public/homes#top'
  scope module: :public do
    get "/about" => "public/homes#about" , as: "about"
    resources :items, only: [:index, :show, :create]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :index, :show, :create, :comfirm, :compleate]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  devise_for :customers, :controllers => {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions',
    :passwords => 'public/passwords'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

end
