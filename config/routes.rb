Rails.application.routes.draw do

  get 'articlesections/view_more'
  devise_for :userauthentications
  resources :articlesections
  root 'articlesections#all_articles'
  get 'commentsections/new'
  get 'likesections/new_like'
  get 'likesections/remove_like'
  get 'favorites/add'
  get 'favorites/remove'
  get 'favorites/show'
  post "/commentsections/new", :to => 'commentsections#create'

end
