require "test_helper"

class TitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @title = titles(:one)
  end

  test "should get index" do
    get titles_url
    assert_response :success
  end

  test "should get new" do
    get new_title_url
    assert_response :success
  end

  test "should create title" do
    assert_difference("Title.count") do
      post titles_url, params: { title: { content_url: @title.content_url, desccription: @title.desccription, name: @title.name, thumbnail_url: @title.thumbnail_url, user_id: @title.user_id, year: @title.year } }
    end

    assert_redirected_to title_url(Title.last)
  end

  test "should show title" do
    get title_url(@title)
    assert_response :success
  end

  test "should get edit" do
    get edit_title_url(@title)
    assert_response :success
  end

  test "should update title" do
    patch title_url(@title), params: { title: { content_url: @title.content_url, desccription: @title.desccription, name: @title.name, thumbnail_url: @title.thumbnail_url, user_id: @title.user_id, year: @title.year } }
    assert_redirected_to title_url(@title)
  end

  test "should destroy title" do
    assert_difference("Title.count", -1) do
      delete title_url(@title)
    end

    assert_redirected_to titles_url
  end
end
