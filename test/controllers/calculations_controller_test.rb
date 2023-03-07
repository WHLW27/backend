require "test_helper"

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calculation = calculations(:one)
  end

  test "should get index" do
    get calculations_url, as: :json
    assert_response :success
  end

  test "should create calculation" do
    assert_difference("Calculation.count") do
      post calculations_url, params: { calculation: { year0: @calculation.year0, year1: @calculation.year1, year2: @calculation.year2, year3: @calculation.year3, year4: @calculation.year4, year5: @calculation.year5 } }, as: :json
    end

    assert_response :created
  end

  test "should show calculation" do
    get calculation_url(@calculation), as: :json
    assert_response :success
  end

  test "should update calculation" do
    patch calculation_url(@calculation), params: { calculation: { year0: @calculation.year0, year1: @calculation.year1, year2: @calculation.year2, year3: @calculation.year3, year4: @calculation.year4, year5: @calculation.year5 } }, as: :json
    assert_response :success
  end

  test "should destroy calculation" do
    assert_difference("Calculation.count", -1) do
      delete calculation_url(@calculation), as: :json
    end

    assert_response :no_content
  end
end
