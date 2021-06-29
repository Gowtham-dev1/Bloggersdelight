class ArticlesectionsController < ApplicationController
  before_action :set_articlesection, only: %i[ show edit update destroy ]
  before_action :authenticate_userauthentication! #unless Rails.env.test?  #--> for general
  # GET /articlesections or /articlesections.json
  def index
    @articlesections = Articlesection.all
  end

  # GET /articlesections/1 or /articlesections/1.json
  def show
    @article_id=params[:id]
    @like_count = (Articlesection.find_by id:@article_id).likes_count
    @comments = Commentsection.order('created_at DESC')
    @likes = (Likesection.find_by articlesection_id: @article_id).users_liked
  end

  # GET /articlesections/new
  def new
    @articlesection = Articlesection.new
  end

  # GET /articlesections/1/edit
  def edit
  end

  # POST /articlesections or /articlesections.json
  def create
    @articlesection = Articlesection.new(articlesection_params)

    respond_to do |format|
      if @articlesection.save
        #creating a new row in Likesection table with article id

        @new_one=Likesection.new
        @new_one.articlesection_id= @articlesection.id
        @new_one.users_liked=""
        @new_one.save

        format.html { redirect_to @articlesection, notice: "Articlesection was successfully created." }
        format.json { render :show, status: :created, location: @articlesection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articlesection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articlesections/1 or /articlesections/1.json
  def update
    respond_to do |format|
      if @articlesection.update(articlesection_params)
        format.html { redirect_to @articlesection, notice: "Articlesection was successfully updated." }
        format.json { render :show, status: :ok, location: @articlesection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articlesection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articlesections/1 or /articlesections/1.json
  def destroy
    @articlesection.destroy
    respond_to do |format|
      format.html { redirect_to articlesections_url, notice: "Article successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def all_articles
    @user= Userauthentication.all
    @articles = Articlesection.order('created_at DESC')
    @likesection = Likesection.all
    @favo=Favorite.all
  end

  def view_more
    @article_id=params[:article_id]
    @articlesection = Articlesection.find_by id:@article_id
    @like_count = (Articlesection.find_by id:@article_id).likes_count
    @comments = Commentsection.order('created_at DESC')
    @likes = (Likesection.find_by articlesection_id: @article_id).users_liked
    @user = (Userauthentication.find_by id:@articlesection.userauthentication_id).email
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articlesection
      @articlesection = Articlesection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def articlesection_params
      params.require(:articlesection).permit(:userauthentication_id, :article_topic, :article_content, :likes_count)
    end

end
