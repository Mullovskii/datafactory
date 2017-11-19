require 'test_helper'

class TrafficsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traffic = traffics(:one)
  end

  test "should get index" do
    get traffics_url
    assert_response :success
  end

  test "should get new" do
    get new_traffic_url
    assert_response :success
  end

  test "should create traffic" do
    assert_difference('Traffic.count') do
      post traffics_url, params: { traffic: { annual_turnover: @traffic.annual_turnover, bounce_rate: @traffic.bounce_rate, country_id: @traffic.country_id, country_share: @traffic.country_share, country_visitors: @traffic.country_visitors, country_visits: @traffic.country_visits, website_id: @traffic.website_id } }
    end

    assert_redirected_to traffic_url(Traffic.last)
  end

  test "should show traffic" do
    get traffic_url(@traffic)
    assert_response :success
  end

  test "should get edit" do
    get edit_traffic_url(@traffic)
    assert_response :success
  end

  test "should update traffic" do
    patch traffic_url(@traffic), params: { traffic: { annual_turnover: @traffic.annual_turnover, bounce_rate: @traffic.bounce_rate, country_id: @traffic.country_id, country_share: @traffic.country_share, country_visitors: @traffic.country_visitors, country_visits: @traffic.country_visits, website_id: @traffic.website_id } }
    assert_redirected_to traffic_url(@traffic)
  end

  test "should destroy traffic" do
    assert_difference('Traffic.count', -1) do
      delete traffic_url(@traffic)
    end

    assert_redirected_to traffics_url
  end
end
