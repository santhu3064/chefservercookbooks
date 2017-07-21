#
# Cookbook name :: apache
#Recipe : server
#notifies : action . recepie 

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

cookbook_file '/var/www/html/index.html' do
 source 'index.html'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  notifies :restart, 'service[apache2]', :immediately
end

#bash "inlinescript" do
 #user "root"
 #code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
 #not_if '[ -d /var/www/sites ]'
 #not_if do
  #File.directory?('/var/www/mysites/')
 #end
#end

#execute "run a cript" do
 #user "root"
 #command <<-EOH
 #mkdir  /var/www/mysites/
 #chown -R apache /var/www/mysites/
 #EOH
#end

#directory '/var/www/mysites/' do
# owner 'apache'
# recursive true
 #mode '0755'
#end

service 'apache2' do
	action [:enable,:start ]
end
