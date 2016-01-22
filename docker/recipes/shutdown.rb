bash "docker-pusti" do
  user "root"
  code <<-EOH
  stop docker-openvpn
  EOH
end

service "docker" do
  action :stop
end
