require "test_helper"

class Reader::TopRatedBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reader_top_rated_books_index_url
    assert_response :success
  end
end
