class CommentsectionsController < ApplicationController
  before_action :authenticate_userauthentication!
  
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
    respond_to do |format|
      if new_one.save
        format.html { redirect_to '/', notice: "Comment added." }
      else
        format.html { redirect_to '/', notice: "Comment was not added!!" }
      end
    end
  end

end
