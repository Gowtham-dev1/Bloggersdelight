Rails.application.routes.draw do

  devise_for :userauthentications
  resources :articlesections
  root 'articlesections#all_articles'
end
