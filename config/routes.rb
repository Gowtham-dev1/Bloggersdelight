Rails.application.routes.draw do

  devise_for :userauthentications
  resources :articlesections
  root 'articlesections#all_articles'
  get 'commentsections/new'
  get 'likesections/new_like'
  get 'likesections/remove_like'
  post "/commentsections/new", :to => 'commentsections#create'
end
