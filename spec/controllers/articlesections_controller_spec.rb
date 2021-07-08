require 'rails_helper'

RSpec.describe ArticlesectionsController, type: :controller do
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
      get :all_articles
      expect(response).to be_successful
    end
    it 'Successful show' do
      get :show ,params: {id:@article.id}
      expect(response).to be_successful
    end
    it "Successful index" do
      get :index
      expect(response).to be_successful
    end
    it "Successful view_more" do
      get :view_more, params:{article_id:@article.id}
      expect(response).to be_successful
    end
  end
end
