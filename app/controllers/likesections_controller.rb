class LikesectionsController < ApplicationController
  before_action :authenticate_userauthentication!

  def new_like
    @article_id= params[:article_id]
    @artic=Likesection.find_by articlesection_id:@article_id
    s=@artic.users_liked.to_s
    s<<current_userauthentication.id.to_s
    s<<','
    @artic.update(users_liked: s)
    @article_likes_count = Articlesection.find_by id:@article_id
    count=@article_likes_count.likes_count
    count+=1
    @article_likes_count.update(likes_count: count)
    redirect_to root_path(anchor: 'like'<< @article_id.to_s )
  end

  def remove_like
    @article_id= params[:article_id]
    @artic=Likesection.find_by articlesection_id:@article_id
    s=@artic.users_liked.split(",")
    s.delete(current_userauthentication.id.to_s)
    s=s.join(",")
    s<<","
    if(s == nil)
      s=""
    end
    @artic.update(users_liked: s)
    @article_likes_count = Articlesection.find_by id:@article_id
    count=@article_likes_count.likes_count
    count-=1
    @article_likes_count.update(likes_count: count)
    redirect_to '/'
  end

end
