require 'test_helper'

class HabbitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habbit = habbits(:one)
  end

  test "should get index" do
    get habbits_url
    assert_response :success
  end

  test "should get new" do
    get new_habbit_url
    assert_response :success
  end

  test "should create habbit" do
    assert_difference('Habbit.count') do
      post habbits_url, params: { habbit: { country_id: @habbit.country_id, description: @habbit.description, share_id: @habbit.share_id, system_id: @habbit.system_id } }
    end

    assert_redirected_to habbit_url(Habbit.last)
  end

  test "should show habbit" do
    get habbit_url(@habbit)
    assert_response :success
  end

  test "should get edit" do
    get edit_habbit_url(@habbit)
    assert_response :success
  end

  test "should update habbit" do
    patch habbit_url(@habbit), params: { habbit: { country_id: @habbit.country_id, description: @habbit.description, share_id: @habbit.share_id, system_id: @habbit.system_id } }
    assert_redirected_to habbit_url(@habbit)
  end

  test "should destroy habbit" do
    assert_difference('Habbit.count', -1) do
      delete habbit_url(@habbit)
    end

    assert_redirected_to habbits_url
  end
end
