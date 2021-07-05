require 'rails_helper'

RSpec.describe ArticlesectionsController, type: :controller do
  context 'checking get methods' do
    it 'Successful all_articles' do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      get :all_articles
      expect(response).to be_successful
    end
    it 'Successful show' do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      user=create(:userauthentication)
      fav=create(:articlesection,userauthentication_id:user.id)
      like=create(:likesection, articlesection_id:fav.id)
      get :show ,params: {id:fav.id}
      expect(response).to be_successful
    end
  end
end
