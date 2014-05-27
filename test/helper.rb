require File.expand_path("../app", File.dirname(__FILE__))
require "cuba/test"

require 'capybara'
require "capybara/dsl"

class Cutest::Scope
  if defined? Capybara::DSL
    include Capybara::DSL
  else
    include Capybara
  end
end

Capybara.app = Cuba

prepare do
  Capybara.reset!
end

class Cutest::Scope
  def session
    Capybara.current_session.driver.request.env["rack.session"]
  end
end
