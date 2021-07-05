require 'rails_helper'

RSpec.describe "On Articlesection API",type: :request do

	context 'CRUD functionalities' do
		before do
			@user=create(:userauthentication)
			@fav=create(:articlesection,userauthentication_id:@user.id)
			@like=create(:likesection, articlesection_id:@fav.id)
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

	context 'POST on API' do
		it 'Add value in api' do
			@user=create(:userauthentication)
			post '/api/v1/articlesections' ,params: {article_topic:"AI" , article_content: "AIAI",userauthentication_id: @user.id,users_liked:0}
			expect(response).to be_successful
		end
	end
end
