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
    if new_one.save
      @articlesection=Articlesection.find_by id:params[:articlesection_id]
      @comments = Commentsection.order('created_at DESC')
      new_activity=Activitysection.new
      new_activity.userauthentication_id=current_userauthentication.id
      new_activity.activity="Commented on an article"
      new_activity.articlesection_id=params[:articlesection_id]
      new_activity.save
    else
      redirect_to request.referrer, notice: "Comment was not added!!"
    end

  end

end
