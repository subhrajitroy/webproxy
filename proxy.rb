require 'sinatra'
require 'json'
require 'httpclient'
require_relative	'request_store'

set :server, 'webrick'

host_map = {"google" => "google.co.uk","bbc" => "bbc.co.uk","stackoverflow" => "stackoverflow.com"}

request_store = RequestStore.new

get %r{/proxy/([^/]+)(/?)(.*)} do
   host_key = params[:captures].first
   host = host_map[host_key]
   proxied_url = params[:captures][2]
   client = HTTPClient.new
   url = "http://#{host}/#{proxied_url}"
   puts url
   request_store.add request.env.to_json
   client.get_content url
end

get "/requests" do
 JSON.pretty_generate request_store.all
end