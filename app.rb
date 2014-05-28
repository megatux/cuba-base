require 'rack/protection'
require 'cuba'
require 'cuba/render'

Cuba.use Rack::Session::Cookie, secret: '192304-13274-isfsjkfljaskdhf82374jshfdlsjfdlsj0982374jsldf.m,gn'
Cuba.use Rack::Protection
Cuba.use Rack::Static, root: 'public', urls: ["/js", "/css", "/img"]

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = 'slim'

Dir["./lib/**/*.rb"].each     { |rb| require rb }
Dir["./models/**/*.rb"].each  { |rb| require rb }
Dir["./routes/**/*.rb"].each  { |rb| require rb }

Cuba.define do
  on get do
    on "hello" do
      res.write view('home')
    end

    on root do
      res.redirect "/hello"
    end
  end
end
