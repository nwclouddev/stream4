require "test_helper"

class ContentGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_group = content_groups(:one)
  end

  test "should get index" do
    get content_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_content_group_url
    assert_response :success
  end

  test "should create content_group" do
    assert_difference("ContentGroup.count") do
      post content_groups_url, params: { content_group: { description: @content_group.description, name: @content_group.name } }
    end

    assert_redirected_to content_group_url(ContentGroup.last)
  end

  test "should show content_group" do
    get content_group_url(@content_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_group_url(@content_group)
    assert_response :success
  end

  test "should update content_group" do
    patch content_group_url(@content_group), params: { content_group: { description: @content_group.description, name: @content_group.name } }
    assert_redirected_to content_group_url(@content_group)
  end

  test "should destroy content_group" do
    assert_difference("ContentGroup.count", -1) do
      delete content_group_url(@content_group)
    end

    assert_redirected_to content_groups_url
  end
end
