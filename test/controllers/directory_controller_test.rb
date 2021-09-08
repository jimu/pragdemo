require "test_helper"

class DirectoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get directory_index_url
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.directory li', 3
    assert_select 'h2', 'markr'
  end
end
