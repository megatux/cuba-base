require_relative "helper"

scope do
  test "Homepage" do
    visit "/"
    assert page.has_content?('Hello world!')
  end
end
