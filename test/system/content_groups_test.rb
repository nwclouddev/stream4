# frozen_string_literal: true

require 'application_system_test_case'

class ContentGroupsTest < ApplicationSystemTestCase
  setup do
    @content_group = content_groups(:one)
  end

  test 'visiting the index' do
    visit content_groups_url
    assert_selector 'h1', text: 'Content groups'
  end

  test 'should create content group' do
    visit content_groups_url
    click_on 'New content group'

    fill_in 'Description', with: @content_group.description
    fill_in 'Name', with: @content_group.name
    click_on 'Create Content group'

    assert_text 'Content group was successfully created'
    click_on 'Back'
  end

  test 'should update Content group' do
    visit content_group_url(@content_group)
    click_on 'Edit this content group', match: :first

    fill_in 'Description', with: @content_group.description
    fill_in 'Name', with: @content_group.name
    click_on 'Update Content group'

    assert_text 'Content group was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Content group' do
    visit content_group_url(@content_group)
    click_on 'Destroy this content group', match: :first

    assert_text 'Content group was successfully destroyed'
  end
end
