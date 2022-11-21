Rails.application.routes.draw do
  # get 'posts/new' #削除
  devise_for :users
  
  root "home#top"

  resources :posts, only: [:new, :create, :show, :index] # 追加

  # get 'home/top' 元のコード
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
