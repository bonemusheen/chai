require_relative "config/environment"
require "sinatra"
require "omniauth"
require "omniauth-facebook"

set :port, ENV["PORT"] || 4567

configure :production do
  require "rack/ssl"
  use Rack::SSL
end

use Rack::Session::Cookie

helpers do
  include Rack::Utils
    alias_method :h, :escape_html
end

get "/" do
  erb :index
end

after do
  ActiveRecord::Base.clear_active_connections!
end