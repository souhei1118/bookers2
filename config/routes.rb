Rails.application.routes.draw do
 devise_for :users
 root to: "homes#top"

 resources :books, only: [:new, :create, :index, :show, :destroy]do
 end

 resources :users, only: [:index,:show,:edit,:update]do
 end

 get "/home/about" => "homes#about", as: "about"

end
