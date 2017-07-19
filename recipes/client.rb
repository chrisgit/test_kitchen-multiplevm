# WebClient
# Update hosts to allow the WebServer to be accessed via http://webserver

execute 'add server to hosts' do
  not_if 'grep webserver /etc/hosts'
  command 'echo 192.168.50.4   webserver >> /etc/hosts'
  action :run
end
