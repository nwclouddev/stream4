# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get events_index_url
    assert_response :success
  end

  test 'should get destroy' do
    get events_destroy_url
    assert_response :success
  end
end
