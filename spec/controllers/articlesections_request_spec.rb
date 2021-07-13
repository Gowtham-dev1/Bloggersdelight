require 'rails_helper'

RSpec.describe "On Articlesection API",type: :request do

	context 'CRUD functionalities' do
		before do
			@user=create(:userauthentication)
			@category=create(:categorysection)
			@article=create(:articlesection,userauthentication_id:@user.id,categorysection_id:@category.id)
			@fav=Favorite.create(articlesection_id:@article.id,userauthentication_id:@user.id)
			@like=Likesection.create(articlesection_id:@article.id)
		end

		it 'returns success response' do
			get api_v1_articlesections_path
			expect(response).to be_successful
	  end

		it 'shows data in api' do
			get api_v1_articlesections_path+"/"+@article.id.to_s
			expect(response).to be_successful
		end

		it 'deletes data in api' do
			delete api_v1_articlesections_path+"/"+@article.id.to_s
			expect(response).to be_successful
		end

		it 'updates data in api' do
			put api_v1_articlesections_path+"/"+@article.id.to_s , params: {topic: @article.article_topic}
			expect(response).to be_successful
		end
	end

	context 'POST on API' do
		it 'Add value in api' do
			@user=create(:userauthentication)
			@category=create(:categorysection)
			post '/api/v1/articlesections' ,params: {article_topic:"AI" , article_content: "AIAI",userauthentication_id: @user.id,users_liked:0,categorysection_id:@category.id}
			expect(valid_json?(response)).to eq(true)
		end
	end

	context 'Custom API call' do
		it 'Showall in API' do
			user=create(:userauthentication)
			category=create(:categorysection)
			article=create(:articlesection,userauthentication_id:user.id,categorysection_id:category.id)
			comment=Commentsection.create(userauthentication_id:user.id,articlesection_id:article.id,comment:"WoW")
			like=Likesection.create(articlesection_id:article.id)
			liked_user=Likeduser.create(likesection_id:like.id,userauthentication_id:user.id)
			get '/api/v1/articlesections/showall'+"/"+article.id.to_s
			expect(response).to be_successful
		end
	end

	def valid_json?(response)
    if JSON.parse(response.body.to_s)
      return true
    end
    return false
  end
end
