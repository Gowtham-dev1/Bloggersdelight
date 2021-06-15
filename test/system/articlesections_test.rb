require "application_system_test_case"

class ArticlesectionsTest < ApplicationSystemTestCase
  setup do
    @articlesection = articlesections(:one)
  end

  test "visiting the index" do
    visit articlesections_url
    assert_selector "h1", text: "Articlesections"
  end

  test "creating a Articlesection" do
    visit articlesections_url
    click_on "New Articlesection"

    fill_in "Article content", with: @articlesection.article_content
    fill_in "Article topic", with: @articlesection.article_topic
    fill_in "Likes count", with: @articlesection.likes_count
    fill_in "User", with: @articlesection.user_id
    click_on "Create Articlesection"

    assert_text "Articlesection was successfully created"
    click_on "Back"
  end

  test "updating a Articlesection" do
    visit articlesections_url
    click_on "Edit", match: :first

    fill_in "Article content", with: @articlesection.article_content
    fill_in "Article topic", with: @articlesection.article_topic
    fill_in "Likes count", with: @articlesection.likes_count
    fill_in "User", with: @articlesection.user_id
    click_on "Update Articlesection"

    assert_text "Articlesection was successfully updated"
    click_on "Back"
  end

  test "destroying a Articlesection" do
    visit articlesections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Articlesection was successfully destroyed"
  end
end
