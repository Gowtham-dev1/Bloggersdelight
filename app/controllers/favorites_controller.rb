class FavoritesController < ApplicationController
  before_action :authenticate_userauthentication!

  def add
    new_one=Favorite.new
    new_one.userauthentication_id=current_userauthentication.id
    new_one.articlesection_id=params[:article_id]
    respond_to do |format|
      if new_one.save
        new_activity=Activitysection.new
        new_activity.userauthentication_id=current_userauthentication.id
        new_activity.activity="Added a favorite article"
        new_activity.articlesection_id=params[:article_id]
        new_activity.save
        format.html { redirect_to '/', notice: "Favorite added." }
      end
    end
  end

  def remove
    new_one=Favorite.find_by userauthentication_id: current_userauthentication.id , articlesection_id: params[:article_id]
    respond_to do |format|
      if new_one.destroy
        new_activity=Activitysection.new
        new_activity.userauthentication_id=current_userauthentication.id
        new_activity.activity="Article removed from favorites"
        new_activity.articlesection_id=params[:article_id]
        new_activity.save
        format.html { redirect_to '/', notice: "Favorite removed." }
      end
    end
  end

  def show
    @favorites=current_userauthentication.favorites.order('created_at DESC')
  end
end
