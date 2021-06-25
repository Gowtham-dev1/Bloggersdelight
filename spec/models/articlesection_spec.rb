require 'rails_helper'

RSpec.describe Articlesection, :type => :model do
  it "ensures validity" do
    fav=Articlesection.create(userauthentication_id:10,article_topic: "ok",article_content: "okokok",likes_count: 0).save
    expect(fav).to eq(true)
  end
end
