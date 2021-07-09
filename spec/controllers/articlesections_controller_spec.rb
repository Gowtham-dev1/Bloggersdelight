require 'rails_helper'

RSpec.describe 'ArticlesectionsController', type: :request do
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
    it 'Displaying Home page before login?' do
      get root_path
      expect(response).to render_template 'articlesections/all_articles'
    end
    it 'Displaying Home page after login?' do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      get root_path
      expect(response).to render_template 'articlesections/all_articles'

    end
    it 'Home page to My Articles' do
      user=create(:userauthentication)
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(ArticlesectionsController).to receive(:current_userauthentication) {user}
      get root_path
      get articlesections_path
      expect(response).to render_template'articlesections/index'
    end
    it 'Home page to New Article' do
      user=create(:userauthentication)
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(ArticlesectionsController).to receive(:current_userauthentication) {user}
      get root_path
      get new_articlesection_path
      expect(response).to render_template'articlesections/new'
    end
    it 'Home page to Favorites' do
      user=create(:userauthentication)
      allow_any_instance_of(FavoritesController).to receive(:authenticate_userauthentication!) {true}
      allow_any_instance_of(FavoritesController).to receive(:current_userauthentication) {user}
      get root_path
      get favorites_show_path
      expect(response).to render_template'favorites/show'
    end

  end
end
