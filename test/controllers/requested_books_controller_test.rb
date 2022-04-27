require "test_helper"

class RequestedBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requested_books_index_url
    assert_response :success
  end

  test "should get show" do
    get requested_books_show_url
    assert_response :success
  end

  test "should get requestBook" do
    get requested_books_requestBook_url
    assert_response :success
  end
end
