require 'cuba'
require 'rack/protection'

Cuba.use Rack::Session::Cookie, secret: "192304-13274-isfsjkfljaskdhf82374jshfdlsjfdlsj0982374jsldf.m,gn"
Cuba.use Rack::Protection

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end
