require 'sinatra'
require 'json'
require 'httpclient'

set :server, 'webrick'

host_map = {"google" => "google.co.uk","bbc" => "bbc.co.uk","stackoverflow" => "stackoverflow.com"}

get %r{/proxy/([^/]+)(/?)(.*)} do
   host_key = params[:captures].first
   host = host_map[host_key]
   proxied_url = params[:captures][2]
   client = HTTPClient.new
   url = "http://#{host}/#{proxied_url}"
   puts url
   client.get_content url
end