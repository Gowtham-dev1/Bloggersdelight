require 'rails_helper'

RSpec.describe Articlesection, :type => :model do
  it "Adding user" do
    user=create(:userauthentication)
    expect(user.save).to eq(true)
  end
  it "Adding category" do
    category=create(:categorysection)
    expect(category.save).to eq(true)
  end
  it "Adding Article" do
    # user=Userauthentication.create(email:'123@com', password: '123456' )
    # user.save
    # fav=Articlesection.create(userauthentication_id:user.id,article_topic: "ok",article_content: "okokok",likes_count: 0)

    user=create(:userauthentication)
    category=create(:categorysection)
    article=build(:articlesection , userauthentication_id:user.id,categorysection_id:category.id)
    expect(article.save).to eq(true)
  end
  it "Article Liked?" do
    user=create(:userauthentication)
    category=create(:categorysection)
    article=create(:articlesection , userauthentication_id:user.id,categorysection_id:category.id)
    like=Likesection.create(articlesection_id:article.id)
    expect(like.save).to eq(true)
  end
  it "Adding Likes" do
    user=create(:userauthentication)
    category=create(:categorysection)
    article=create(:articlesection , userauthentication_id:user.id,categorysection_id:category.id)
    like=Likesection.create(articlesection_id:article.id)
    addlike=Likeduser.create(userauthentication_id:user.id,likesection_id:like.id)
    expect(addlike.save).to eq(true)
  end
end
