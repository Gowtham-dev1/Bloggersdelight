require 'rails_helper'

RSpec.describe ArticlesectionsController, type: :controller do
  context 'checking get #all_articles' do
    it 'successful response' do
      get :all_articles
      expect(response).to be_successful
    end
    it 'successful show' do
      user=Userauthentication.create(email:'123@com', password: '123456' )
      user.save
      fav=Articlesection.create(userauthentication_id:user.id,article_topic: "ok",article_content: "okokok",likes_count: 0)
      fav.save
      like=Likesection.create(articlesection_id:fav.id,users_liked:0)
      get :show ,params: {id:fav.id}
      expect(response).to be_successful
    end
  end
end
