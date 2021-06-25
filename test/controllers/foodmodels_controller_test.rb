require "test_helper"

class FoodmodelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foodmodel = foodmodels(:one)
  end

  test "should get index" do
    get foodmodels_url, as: :json
    assert_response :success
  end

  test "should create foodmodel" do
    assert_difference('Foodmodel.count') do
      post foodmodels_url, params: { foodmodel: { image: @foodmodel.image, name: @foodmodel.name, recipe: @foodmodel.recipe } }, as: :json
    end

    assert_response 201
  end

  test "should show foodmodel" do
    get foodmodel_url(@foodmodel), as: :json
    assert_response :success
  end

  test "should update foodmodel" do
    patch foodmodel_url(@foodmodel), params: { foodmodel: { image: @foodmodel.image, name: @foodmodel.name, recipe: @foodmodel.recipe } }, as: :json
    assert_response 200
  end

  test "should destroy foodmodel" do
    assert_difference('Foodmodel.count', -1) do
      delete foodmodel_url(@foodmodel), as: :json
    end

    assert_response 204
  end
end
