require 'rails_helper'

RSpec.describe ArticlesectionsController, type: :controller do
  context 'checking get #all_articles' do
    it 'successful response' do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      get :all_articles
      expect(response).to be_successful
    end
    it 'successful show' do
      allow_any_instance_of(ArticlesectionsController).to receive(:authenticate_userauthentication!) {true}
      user=create(:userauthentication)
      fav=create(:articlesection,userauthentication_id:user.id)
      like=create(:likesection, articlesection_id:fav.id)
      get :show ,params: {id:fav.id}
      expect(response).to be_successful
    end
  end
end
