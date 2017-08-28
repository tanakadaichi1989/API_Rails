require 'test_helper'

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable = timetables(:one)
  end

  test "should get index" do
    get timetables_url, as: :json
    assert_response :success
  end

  test "should create timetable" do
    assert_difference('Timetable.count') do
      post timetables_url, params: { timetable: { dept_time: @timetable.dept_time, destination: @timetable.destination, memo: @timetable.memo, train_type: @timetable.train_type } }, as: :json
    end

    assert_response 201
  end

  test "should show timetable" do
    get timetable_url(@timetable), as: :json
    assert_response :success
  end

  test "should update timetable" do
    patch timetable_url(@timetable), params: { timetable: { dept_time: @timetable.dept_time, destination: @timetable.destination, memo: @timetable.memo, train_type: @timetable.train_type } }, as: :json
    assert_response 200
  end

  test "should destroy timetable" do
    assert_difference('Timetable.count', -1) do
      delete timetable_url(@timetable), as: :json
    end

    assert_response 204
  end
end
