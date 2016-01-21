bash "docker-pusti" do
  user "root"
  code <<-EOH
    docker run -v /mnt/openvpn:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
  EOH
end
