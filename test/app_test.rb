require 'cuba/test'
require File.expand_path("../app", File.dirname(__FILE__))

scope do
  test "Homepage" do
    get "/"

    follow_redirect!

    assert_equal "Hello world!", last_response.body
  end
end
