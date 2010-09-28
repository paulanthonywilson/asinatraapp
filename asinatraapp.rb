require 'rubygems'
require 'sinatra'

get '/' do
  result = "<html><title><p>Your IP</title><body>Hello.  Your IP is #{ @env['REMOTE_ADDR'] }.<p>"
  result << "<p>Other things of interest might be:-</p><ul>"
  @env.each do |k,v|
    result << "<li>#{ERB::Util.html_escape(k)} = #{ERB::Util.html_escape(v)}"
  end
  result << "  Thank you, and good night.</body></html>"

end
