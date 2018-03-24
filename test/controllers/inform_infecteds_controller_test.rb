require 'test_helper'

class InformInfectedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inform_infected = inform_infecteds(:one)
  end

  test "should get index" do
    get inform_infecteds_url, as: :json
    assert_response :success
  end

  test "should create inform_infected" do
    assert_difference('InformInfected.count') do
      post inform_infecteds_url, params: { inform_infected: { survivor_infected_id: @inform_infected.survivor_infected_id, survivor_send_id: @inform_infected.survivor_send_id } }, as: :json
    end

    assert_response 201
  end

  test "should show inform_infected" do
    get inform_infected_url(@inform_infected), as: :json
    assert_response :success
  end

  test "should update inform_infected" do
    patch inform_infected_url(@inform_infected), params: { inform_infected: { survivor_infected_id: @inform_infected.survivor_infected_id, survivor_send_id: @inform_infected.survivor_send_id } }, as: :json
    assert_response 200
  end

  test "should destroy inform_infected" do
    assert_difference('InformInfected.count', -1) do
      delete inform_infected_url(@inform_infected), as: :json
    end

    assert_response 204
  end
end
