Rails.application.routes.draw do

  devise_for :userauthentications
  resources :articlesections
  root 'userdetails#index'
  get 'userdetails/about'
end
