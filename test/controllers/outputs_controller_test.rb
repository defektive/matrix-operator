require 'test_helper'

class OutputsControllerTest < ActionController::TestCase
  setup do
    @output = outputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outputs)
  end

  test "should create output" do
    assert_difference('Output.count') do
      post :create, output: { input: @output.input, name: @output.name, output: @output.output }
    end

    assert_response 201
  end

  test "should show output" do
    get :show, id: @output
    assert_response :success
  end

  test "should update output" do
    put :update, id: @output, output: { input: @output.input, name: @output.name, output: @output.output }
    assert_response 204
  end

  test "should destroy output" do
    assert_difference('Output.count', -1) do
      delete :destroy, id: @output
    end

    assert_response 204
  end
end
