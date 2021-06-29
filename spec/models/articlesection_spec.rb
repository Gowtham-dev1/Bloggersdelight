require 'rails_helper'

RSpec.describe Articlesection, :type => :model do
  it "Adding Article" do
    # user=Userauthentication.create(email:'123@com', password: '123456' )
    # user.save
    # fav=Articlesection.create(userauthentication_id:user.id,article_topic: "ok",article_content: "okokok",likes_count: 0)

    user=create(:userauthentication)
    article=build(:articlesection , userauthentication_id:user.id)
    expect(article.save).to eq(true)
  end
end
