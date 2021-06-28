require 'rails_helper'

RSpec.describe "articlesections_request",type: :request do

	context 'On custom api' do
		before do
			@user=Userauthentication.create(email:'123@com', password: '123456' )
			@user.save
			@fav=Articlesection.create(userauthentication_id:@user.id,article_topic: "ok",article_content: "okokok",likes_count: 0)
			@fav.save
			@like=Likesection.create(articlesection_id:@fav.id,users_liked:0)
		end
		
		it 'returns success response' do
			get api_v1_articlesections_path
			expect(response).to be_successful
	  end

		it 'shows data in api' do
			get api_v1_articlesections_path+"/"+@fav.id.to_s
			expect(response).to be_successful
		end

		it 'deletes data in api' do
			delete api_v1_articlesections_path+"/"+@fav.id.to_s
			expect(response).to be_successful
		end

		it 'updates data in api' do
			put api_v1_articlesections_path+"/"+@fav.id.to_s , params: {topic: @fav.article_topic}
			expect(response).to be_successful
		end
	end

	context 'Value on custom api' do
		it 'Add value in api' do
			@user=Userauthentication.create(email:'123@com', password: '123456' )
			@user.save
			post '/api/v1/articlesections' ,params: {article_topic:"AI" , article_content: "AIAI",userauthentication_id: @user.id,users_liked:0}
			expect(response).to be_successful
		end
	end
end
