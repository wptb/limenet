template '/etc/init/docker-openvpn.conf' do
  source 'vpn-startup'
  owner 'root'
  group 'root'
  mode '0755'
end

bash "docker-pusti" do
  user "root"
  code <<-EOH
  start docker-openvpn
  EOH
end
