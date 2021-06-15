require "test_helper"

class ArticlesectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articlesection = articlesections(:one)
  end

  test "should get index" do
    get articlesections_url
    assert_response :success
  end

  test "should get new" do
    get new_articlesection_url
    assert_response :success
  end

  test "should create articlesection" do
    assert_difference('Articlesection.count') do
      post articlesections_url, params: { articlesection: { article_content: @articlesection.article_content, article_topic: @articlesection.article_topic, likes_count: @articlesection.likes_count, user_id: @articlesection.user_id } }
    end

    assert_redirected_to articlesection_url(Articlesection.last)
  end

  test "should show articlesection" do
    get articlesection_url(@articlesection)
    assert_response :success
  end

  test "should get edit" do
    get edit_articlesection_url(@articlesection)
    assert_response :success
  end

  test "should update articlesection" do
    patch articlesection_url(@articlesection), params: { articlesection: { article_content: @articlesection.article_content, article_topic: @articlesection.article_topic, likes_count: @articlesection.likes_count, user_id: @articlesection.user_id } }
    assert_redirected_to articlesection_url(@articlesection)
  end

  test "should destroy articlesection" do
    assert_difference('Articlesection.count', -1) do
      delete articlesection_url(@articlesection)
    end

    assert_redirected_to articlesections_url
  end
end
