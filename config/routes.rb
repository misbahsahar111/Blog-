Rails.application.routes.draw do

  devise_for :users
  root "articles#index"
  
  resources :search, only: [:index]
  resources :articles
 
end
