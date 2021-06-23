module Api
  module V1
    class ArticlesectionsController < ApplicationController
      respond_to :json
      protect_from_forgery with: :null_session

      def index
        respond_with Articlesection.all
      end

      def show
        respond_with Articlesection.find_by id: params[:id]
      end

      def destroy
        Articlesection.find(params[:id]).destroy
      end

      def create
        @new = Articlesection.new
        @new.article_topic = params[:topic]
        @new.article_content= params[:content]
        @new.userauthentication_id=params[:user_id]
        @new.likes_count=params[:likes]
        @new.save
      end

      def update
        @update = Articlesection.find_by id: params[:id]
        @update.update(article_topic: params[:topic])
      end

    end
  end
end
