Rails.application.routes.draw do

  use_doorkeeper
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :articlesections
      get 'articlesections/showall/:id', :to=>'articlesections#showall'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
