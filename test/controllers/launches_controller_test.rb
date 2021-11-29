require "test_helper"

class LaunchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @launch = launches(:one)
  end

  test "should get index" do
    get launches_url, as: :json
    assert_response :success
  end

  test "should create launch" do
    assert_difference('Launch.count') do
      post launches_url, params: { launch: { article_id: @launch.article_id, providers: @launch.providers } }, as: :json
    end

    assert_response 201
  end

  test "should show launch" do
    get launch_url(@launch), as: :json
    assert_response :success
  end

  test "should update launch" do
    patch launch_url(@launch), params: { launch: { article_id: @launch.article_id, providers: @launch.providers } }, as: :json
    assert_response 200
  end

  test "should destroy launch" do
    assert_difference('Launch.count', -1) do
      delete launch_url(@launch), as: :json
    end

    assert_response 204
  end
end
