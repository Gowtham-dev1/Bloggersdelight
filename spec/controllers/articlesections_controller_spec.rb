require 'rails_helper'

RSpec.describe 'Controller Check', type: :request do
  context 'checking all methods' do
    before do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      @user=create(:userauthentication)
      @category=create(:categorysection)
      @article=create(:articlesection,userauthentication_id:@user.id,categorysection_id:@category.id)
      @fav=Favorite.create(articlesection_id:@article.id,userauthentication_id:@user.id)
      @like=Likesection.create(articlesection_id:@article.id)
      allow_any_instance_of(ArticlesectionsController).to receive(:current_userauthentication) {@user}
    end
    it 'Successful all_articles' do
      get root_path
      expect(response).to be_successful
    end
    it 'Successful show' do
      get articlesections_path ,params: {id:@article.id}
      expect(response).to be_successful
    end
    it "Successful index" do
      get articlesections_path
      expect(response).to be_successful
    end
    it "Successful view_more" do
      get articlesections_view_more_path, params:{article_id:@article.id}
      expect(response).to be_successful
    end
  end

  context 'Checking flow of application' do

    before do
      @user=create(:userauthentication)
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(ArticlesectionsController).to receive(:current_userauthentication) {@user}
      allow_any_instance_of(FavoritesController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(FavoritesController).to receive(:current_userauthentication) {@user}
      allow_any_instance_of(ActivitysectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(ActivitysectionsController).to receive(:current_userauthentication) {@user}
      allow_any_instance_of(LikesectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(LikesectionsController).to receive(:current_userauthentication) {@user}
      allow_any_instance_of(CommentsectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(CommentsectionsController).to receive(:current_userauthentication) {@user}
      @category=create(:categorysection)
			@article=create(:articlesection,userauthentication_id:@user.id,categorysection_id:@category.id)
      @fav=Favorite.create(articlesection_id:@article.id,userauthentication_id:@user.id)
			@comment=Commentsection.create(userauthentication_id:@user.id,articlesection_id:@article.id,comment:"WoW")
			@like=Likesection.create(articlesection_id:@article.id)
			@liked_user=Likeduser.create(likesection_id:@like.id,userauthentication_id:@user.id)
    end

    it 'Displaying Home page before login?' do
      get root_path
      expect(response).to render_template 'articlesections/all_articles'
    end
    it 'Displaying Home page after login?' do
      get root_path
      expect(response).to render_template 'articlesections/all_articles'

    end
    it 'Home page to My Articles' do
      get root_path
      get articlesections_path
      expect(response).to render_template'articlesections/index'
    end
    it 'My Articles to Home page' do
      get root_path
      get articlesections_path
      get root_path
      expect(response).to render_template'articlesections/all_articles'
    end
    it 'Home page to New Article' do
      get root_path
      get new_articlesection_path
      expect(response).to render_template'articlesections/new'
    end
    it 'New Article to Home page' do
      get root_path
      get new_articlesection_path
      get root_path
      expect(response).to render_template'articlesections/all_articles'
    end
    it 'Home page to Favorites' do
      get root_path
      get favorites_show_path
      expect(response).to render_template'favorites/show'
    end
    it 'Home page to My Activities' do
      get root_path
      get activitysections_view_activity_path
      expect(response).to render_template'activitysections/view_activity'
    end
    it 'My Activities to Home page' do
      get root_path
      get activitysections_view_activity_path
      get root_path
      expect(response).to render_template'articlesections/all_articles'
    end
    it 'Favorites page to view_more page' do
      get root_path
      get favorites_show_path
      get articlesections_view_more_path, params:{article_id:@article.id}
      expect(response).to render_template'articlesections/view_more'
    end
    it 'Liking an article' do
      get root_path
      get likesections_new_like_path, params:{article_id:@article.id}
      expect(response).to  redirect_to'/'
    end
    it 'Removing like from article' do
      get root_path
      get likesections_new_like_path, params:{article_id:@article.id}
      get likesections_remove_like_path, params:{article_id:@article.id}
      expect(response).to  redirect_to'/'
    end
    it 'My activity page to view_more page' do
      get root_path
      get activitysections_view_activity_path
      get articlesections_view_more_path, params:{article_id:@article.id}
      expect(response).to render_template'articlesections/view_more'
    end
    it 'Home page to comment page' do
      get root_path
      get commentsections_new_path,params:{article_id:@article.id}
      expect(response).to render_template'commentsections/new'
    end
    it 'Posting new comment' do
      get root_path
      get commentsections_new_path,params:{article_id:@article.id}
      post commentsections_new_path,params:{articlesection_id:@article.id,userauthentication_id:@user.id,comment:"Cool"}
      expect(response).to render_template'commentsections/_show'
    end
    it 'Comment page to Home page' do
      get root_path
      get commentsections_new_path,params:{article_id:@article.id}
      get root_path
      expect(response).to render_template'articlesections/all_articles'
    end

  end
end
