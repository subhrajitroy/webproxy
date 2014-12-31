require 'sinatra'
require_relative 'object_ext'

get %r{/.*} do
  "URL : #{request.fullpath}"
end