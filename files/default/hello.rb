# Sinatra Hello World
# Sinatra is a really good Web framework, it is capable of running a wide range of web sites from the very small like this to Enterprise quality
# See: http://www.sinatrarb.com/

require 'sinatra'

VERSION = '1.0.0'

set :bind, '0.0.0.0'
set :port, 80

get '/' do
  format("[%s] Sinatra: Hello World\n", VERSION)
end
