class ArticlesectionsController < ApplicationController
  before_action :set_articlesection, only: %i[ show edit update destroy ]
  before_action :authenticate_userauthentication!
  # GET /articlesections or /articlesections.json
  def index
    @articlesections = Articlesection.all
  end

  # GET /articlesections/1 or /articlesections/1.json
  def show
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
