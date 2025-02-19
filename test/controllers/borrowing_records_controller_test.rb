require "test_helper"

class BorrowingRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrowing_records_index_url
    assert_response :success
  end

  test "should get show" do
    get borrowing_records_show_url
    assert_response :success
  end
end
