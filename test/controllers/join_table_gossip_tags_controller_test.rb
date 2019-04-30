require 'test_helper'

class JoinTableGossipTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_table_gossip_tags_new_url
    assert_response :success
  end

  test "should get index" do
    get join_table_gossip_tags_index_url
    assert_response :success
  end

  test "should get create" do
    get join_table_gossip_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get join_table_gossip_tags_destroy_url
    assert_response :success
  end

  test "should get update" do
    get join_table_gossip_tags_update_url
    assert_response :success
  end

  test "should get edit" do
    get join_table_gossip_tags_edit_url
    assert_response :success
  end

  test "should get show" do
    get join_table_gossip_tags_show_url
    assert_response :success
  end

end
