require 'rubygems'
require 'sinatra'

get '/' do
  "<html><title>Your IP</title><body>Hello.  Your IP is #{ @env['REMOTE_ADDR'] }.  Thank you, and good night."
end