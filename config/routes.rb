Rails.application.routes.draw do
  root to: 'public/homes#top'
  get "/about" => "public/homes#about" , as: "about"
  devise_for :customers, :controllers => {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions',
    :passwords => 'public/passwords'
  }
end
