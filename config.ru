require 'sinatra'
require_relative "./config/environment"

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser
use Rack::Cors do
    allow do
        origins "*"
        resource "*", headers: :any, methods:[:get, :post, :patch, :delete]
    end
end

run ApplicationController # this is the line that starts the server

