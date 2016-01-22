template '/etc/init/docker-openvpn.conf' do
  source 'vpn-startup'
  owner 'root'
  group 'root'
  mode '0755'
  not_if do
    File.exists?('/etc/init/docker-openvpn.conf')
  end
end

bash 'docker-run-container' do
  user 'root'
  code <<-EOH
  start docker-openvpn
  EOH
end
