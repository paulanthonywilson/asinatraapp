require 'rubygems'
require 'sinatra'


def geolocation_javascript
  %|
function geolocate(){
  var location = document.getElementById('location');
  navigator.geolocation.getCurrentPosition(function(position){
    location.innerHTML = "" + position.coords.latitude + " " + position.coords.longitude;
  });
}
|
end

get '/' do
  result = "<html><title>Your IP</title><body>Hello.  Your IP is #{@env['HTTP_X_FORWARDED_FOR'] ||  @env['REMOTE_ADDR'] }.<p>"
  result << "<p>Other things of interest might be:-</p><ul>"
  result << @env.map do |k,v|
    "<li>#{ERB::Util.html_escape(k)} = #{ERB::Util.html_escape(v)}"
  end.sort.join
  result << "</ul><p>"

  result << "<p><button onclick='geolocate();'>But where are you?</button></p>"
  result << "<p id='location'></p>"
  result << "<script>#{geolocation_javascript}</script>"
  result << "Thank you, and good night.</p></body></html>"




end
