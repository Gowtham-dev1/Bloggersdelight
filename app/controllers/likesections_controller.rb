class LikesectionsController < ApplicationController
  before_action :authenticate_userauthentication!

  def new_like
    article=Articlesection.find_by id:params[:article_id]
    article.update(likes_count: ((article.likes_count.to_i)+1))
    new_one=Likeduser.new
    new_one.userauthentication_id=current_userauthentication.id
    new_one.likesection_id=article.likesection.id
    if new_one.save
      new_activity=Activitysection.new
      new_activity.userauthentication_id=current_userauthentication.id
      new_activity.activity="Liked an article"
      new_activity.articlesection_id=params[:article_id]
      new_activity.save
    end
    redirect_to '/'
  end

  def remove_like
    article=Articlesection.find_by id:params[:article_id]
    article.update(likes_count: article.likes_count-1)
    new_one=Likeduser.find_by likesection_id:article.likesection.id, userauthentication_id: current_userauthentication.id
    if new_one.destroy
      new_activity=Activitysection.new
      new_activity.userauthentication_id=current_userauthentication.id
      new_activity.activity="Removed like from an article"
      new_activity.articlesection_id=params[:article_id]
      new_activity.save
    end
    redirect_to '/'
  end

end
