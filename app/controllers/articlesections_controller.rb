class ArticlesectionsController < ApplicationController
  before_action :set_articlesection, only: %i[ show edit update destroy ]
  before_action :authenticate_userauthentication! ,except: %i[all_articles] #unless Rails.env.test?

  def index
    @articlesections = Articlesection.where(userauthentication_id:current_userauthentication.id)
    respond_to do |format|
      format.html
      format.csv{ send_data @articlesections.to_csv}
    end
  end

  def show
    @article_id=params[:id]
    @article=Articlesection.find_by id:@article_id
    @like_count = (Articlesection.find_by id:@article_id).likes_count
    @comments = Commentsection.order('created_at DESC')
    @category = Categorysection.find_by id:((Articlesection.find_by id:@article_id).categorysection_id)
    @likes = @article.likesection.likedusers
  end

  def new
    @articlesection = Articlesection.new
    @category = Categorysection.all
  end

  def edit
  end

  def create
    @articlesection = Articlesection.new(articlesection_params)
    # puts"
    # #{params[:category]}
    # "
    respond_to do |format|
      if @articlesection.save
        #creating a new row in Likesection table with article id

        @new_one=Likesection.new
        @new_one.articlesection_id= @articlesection.id
        @new_one.save
        new_activity=Activitysection.new
        new_activity.userauthentication_id=current_userauthentication.id
        new_activity.activity="Added a new article"
        new_activity.articlesection_id=@articlesection.id
        new_activity.save

        format.html { redirect_to @articlesection, notice: "Articlesection was successfully created." }
        format.json { render :show, status: :created, location: @articlesection }
      else
        begin
          raise 'Empty Field'
        rescue
          puts "

          Article cant be saved

          "
        end

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articlesection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @articlesection.update(articlesection_params)
        new_activity=Activitysection.new
        new_activity.userauthentication_id=current_userauthentication.id
        new_activity.activity="Updated an article"
        new_activity.articlesection_id=@articlesection.id
        new_activity.save
        format.html { redirect_to @articlesection, notice: "Articlesection was successfully updated." }
        format.json { render :show, status: :ok, location: @articlesection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articlesection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @articlesection.destroy
    respond_to do |format|
      format.html { redirect_to articlesections_url, notice: "Article successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def all_articles
    @articles = Articlesection.order('created_at DESC').includes(:userauthentication,:likesection,:favorites)
  end

  def view_more
    @article_id=params[:article_id]
    @articlesection = Articlesection.find_by id:@article_id
    @like_count = (Articlesection.find_by id:@article_id).likes_count
    @comments = Commentsection.order('created_at DESC')
    @user = (Userauthentication.find_by id:@articlesection.userauthentication_id).email
    @category = Categorysection.find_by id:((Articlesection.find_by id:@article_id).categorysection_id)
    @likes = @articlesection.likesection.likedusers
  end

  def search_article
    @search = params[:search].to_s.downcase
    if(@search.size>0)
      @bool=false
      @category=Categorysection.where('lower(category) LIKE ?', @search+'%')
      @category.each do|category|
        category.articlesections.each do|i|
          @bool=true
          break
        end
      end
      @articles = Articlesection.where('lower(article_topic) LIKE ?', @search+'%').includes(:userauthentication,:likesection,:favorites)
      if(@articles.length==0 && @bool==false)
        redirect_to '/', :notice => "No results found!"
      end
    else
      redirect_to '/', :notice => "Empty search!"
    end
  end

  private
    def set_articlesection
      @articlesection = Articlesection.find(params[:id])
    end

    def articlesection_params
      params.require(:articlesection).permit(:userauthentication_id, :article_topic, :article_content, :likes_count,:categorysection_id)
    end

end
