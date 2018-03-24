require 'test_helper'

class ViriControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virus = viri(:one)
  end

  test "should get index" do
    get viri_url, as: :json
    assert_response :success
  end

  test "should create virus" do
    assert_difference('Virus.count') do
      post viri_url, params: { virus: { survivor_infected_id: @virus.survivor_infected_id, survivor_send_id: @virus.survivor_send_id } }, as: :json
    end

    assert_response 201
  end

  test "should show virus" do
    get virus_url(@virus), as: :json
    assert_response :success
  end

  test "should update virus" do
    patch virus_url(@virus), params: { virus: { survivor_infected_id: @virus.survivor_infected_id, survivor_send_id: @virus.survivor_send_id } }, as: :json
    assert_response 200
  end

  test "should destroy virus" do
    assert_difference('Virus.count', -1) do
      delete virus_url(@virus), as: :json
    end

    assert_response 204
  end
end
