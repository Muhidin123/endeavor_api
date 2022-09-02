require "test_helper"

class CheckpointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkpoint = checkpoints(:one)
  end

  test "should get index" do
    get checkpoints_url, as: :json
    assert_response :success
  end

  test "should create checkpoint" do
    assert_difference("Checkpoint.count") do
      post checkpoints_url, params: { checkpoint: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show checkpoint" do
    get checkpoint_url(@checkpoint), as: :json
    assert_response :success
  end

  test "should update checkpoint" do
    patch checkpoint_url(@checkpoint), params: { checkpoint: {  } }, as: :json
    assert_response :success
  end

  test "should destroy checkpoint" do
    assert_difference("Checkpoint.count", -1) do
      delete checkpoint_url(@checkpoint), as: :json
    end

    assert_response :no_content
  end
end
