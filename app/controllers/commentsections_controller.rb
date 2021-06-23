class CommentsectionsController < ApplicationController
  before_action :authenticate_userauthentication!

  def new
    @article_id=params[:article_id]
    @comments = Commentsection.order('created_at DESC')
  end

  def create
    new_one=Commentsection.new
    new_one.userauthentication_id= params[:userauthentication_id]
    new_one.articlesection_id= params[:articlesection_id]
    new_one.comment = params[:comment]
    respond_to do |format|
      if new_one.save
        format.html { redirect_to '/', notice: "Comment added." }
      else
        format.html { redirect_to '/', notice: "Comment was not added!!" }
      end
    end
  end

end
