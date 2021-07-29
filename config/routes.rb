Rails.application.routes.draw do
  #devise_for :customers
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  root to: 'public/homes#top'
  get "/about" => "public/homes#about" , as: "about"
   devise_for :customers, :controllers => {
     :registrations => 'customers/registrations',
     :sessions => 'customers/sessions',
     :passwords => 'customers/passwords'
   }
  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
