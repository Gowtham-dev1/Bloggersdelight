class FavoritesController < ApplicationController
  before_action :authenticate_userauthentication!
  
  def add
    @article_id= params[:article_id]
    new_one=Favorite.new
    new_one.userauthentication_id=current_userauthentication.id
    new_one.articlesection_id=@article_id
    if new_one.save
      puts"

      Saved

      "
    else
      puts"

      Failed

      "
    end
    redirect_to '/'
  end

  def remove
    @article_id= params[:article_id]
    new_one=Favorite.find_by userauthentication_id: current_userauthentication.id , articlesection_id: @article_id
    new_one.destroy
    if new_one.save
      puts"

      Saved

      "
    else
      puts"

      Failed

      "
    end
    redirect_to '/'
  end

  def show
    @favorites=Favorite.all
    @article=Articlesection.all
    @user=Userauthentication.all
  end
end
