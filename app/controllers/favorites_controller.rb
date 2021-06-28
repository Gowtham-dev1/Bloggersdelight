class FavoritesController < ApplicationController
  before_action :authenticate_userauthentication!

  def add
    @article_id= params[:article_id]
    new_one=Favorite.new
    new_one.userauthentication_id=current_userauthentication.id
    new_one.articlesection_id=@article_id
    respond_to do |format|
      if new_one.save
        format.html { redirect_to '/', notice: "Favorite added." }
      end
    end
  end

  def remove
    @article_id= params[:article_id]
    new_one=Favorite.find_by userauthentication_id: current_userauthentication.id , articlesection_id: @article_id
    respond_to do |format|
      if new_one.destroy
        format.html { redirect_to '/', notice: "Favorite removed." }
      end
    end
  end

  def show
    @favorites=Favorite.where(userauthentication_id: current_userauthentication)
    @article=Articlesection.all
    @user=Userauthentication.all
  end
end
