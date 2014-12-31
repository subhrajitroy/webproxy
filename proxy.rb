require 'sinatra'
require 'json'
require 'httpclient'

set :server, 'webrick'

get %r{/.*} do
   client = HTTPClient.new
   host = "google.co.uk"
   url = "http://#{host}#{request.fullpath}"
   puts url
   client.get_content url
end