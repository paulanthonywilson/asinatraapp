require 'rubygems'
require 'sinatra'

get '/' do
  result = "<html><title><p>Your IP</title><body>Hello.  Your IP is #{@env['HTTP_X_REAL_IP'] ||  @env['REMOTE_ADDR'] }.<p>"
  result << "<p>Other things of interest might be:-</p><ul>"
  result << @env.map do |k,v|
    "<li>#{ERB::Util.html_escape(k)} = #{ERB::Util.html_escape(v)}"
  end.sort.join
  result << "</ul><p>  Thank you, and good night.</p></body></html>"

end
