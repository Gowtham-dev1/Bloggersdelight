class CommentsectionsController < ApplicationController

  def new
    @article_id=params[:article_id]
    @comments = Commentsection.order('created_at DESC')
  end

  def create
    user_id=params[:userauthentication_id]
    artic_id=params[:articlesection_id]
    commented = params[:comment]
    new_one=Commentsection.new
    new_one.userauthentication_id= user_id
    new_one.articlesection_id= artic_id
    new_one.comment = commented
    new_one.save

    redirect_to "/"
  end

end
