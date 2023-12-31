require "application_system_test_case"

class TitlesTest < ApplicationSystemTestCase
  setup do
    @title = titles(:one)
  end

  test "visiting the index" do
    visit titles_url
    assert_selector "h1", text: "Titles"
  end

  test "should create title" do
    visit titles_url
    click_on "New title"

    fill_in "Content url", with: @title.content_url
    fill_in "Desccription", with: @title.desccription
    fill_in "Name", with: @title.name
    fill_in "Thumbnail url", with: @title.thumbnail_url
    fill_in "User", with: @title.user_id
    fill_in "Year", with: @title.year
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "Content url", with: @title.content_url
    fill_in "Desccription", with: @title.desccription
    fill_in "Name", with: @title.name
    fill_in "Thumbnail url", with: @title.thumbnail_url
    fill_in "User", with: @title.user_id
    fill_in "Year", with: @title.year
    click_on "Update Title"

    assert_text "Title was successfully updated"
    click_on "Back"
  end

  test "should destroy Title" do
    visit title_url(@title)
    click_on "Destroy this title", match: :first

    assert_text "Title was successfully destroyed"
  end
end
