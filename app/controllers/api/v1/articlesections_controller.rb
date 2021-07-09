module Api
  module V1
    class ArticlesectionsController < ApplicationController
      before_action :doorkeeper_authorize! unless Rails.env.test?
      respond_to :json
      protect_from_forgery with: :null_session

      def index
        respond_with Articlesection.all
      end

      def show
        if Articlesection.find_by(id:(params[:id]))==nil
          render json:{message:"No article with id:#{params[:id]}"}
        else
          respond_with Articlesection.find_by id: params[:id]
        end
      end

      def showall
        if Articlesection.find_by(id:(params[:id]))==nil
          render json:{message:"No article with id:#{params[:id]}"}
        else
          article=Articlesection.find_by id: params[:id]
          user=article.userauthentication
          comments=article.commentsections
          category=article.categorysection
          liked_users=article.likesection.likedusers
          respond_with({:author=>user ,:article=>article, :comments => comments,:category=>category,:liked_users=>liked_users})
        end
      end

      def destroy
        if Articlesection.find_by(id:(params[:id]))==nil
          render json:{message:"No article with id:#{params[:id]}"}
        else
          Articlesection.find(params[:id]).destroy
          render json:{message:"Deletion Successful"}
        end
      end

      def create
        new_article = Articlesection.new
        new_article.article_topic = params[:topic]
        new_article.article_content= params[:content]
        new_article.userauthentication_id=params[:user_id]
        new_article.likes_count=params[:likes]
        new_article.categorysection_id=params[:categorysection_id]
        new_article.save
        render json:{article:new_article}
      end

      def update
        if Articlesection.find_by(id:(params[:id]))==nil
          render json:{message:"No article with id:#{params[:id]}"}
        else
          update_article = Articlesection.find_by id: params[:id]
          update_article.update(article_topic: params[:topic])
          render json:{message:"Update Successful",article:update_article}
        end
      end

    end
  end
end
