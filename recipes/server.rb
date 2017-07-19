# WebServer
# Install and configure our Sinatra application

directory '/opt/web/pid' do
  recursive true
  action :create
end

gem_package 'sinatra' do
  action :install
end

cookbook_file '/opt/web/hello.rb' do
  source 'hello.rb'
  mode '0755'
end

# init.d script
template 'say-hello-script' do
  source 'say-hello.erb'
  path '/etc/init.d/webhello'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
    pid_location: '/opt/web/pid',
    app_home: '/opt/web'
  })
  action :create
  notifies :restart, 'service[webhello]', :immediate
end

service 'webhello' do
  action [:enable, :start]
end
