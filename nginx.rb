file '/etc/nginx/nginx.conf' do
  action :delete
end

file '/etc/nginx/nginx.conf' do
  action :create_if_missing
end

file '/etc/nginx/nginx.conf'
  content 'user nginx;
worker_processes  15;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;

events {
  worker_connections  2048;
}

http {
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;


  access_log    /var/log/nginx/access.log;

  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;

  keepalive_timeout  65;

  gzip  on;
  gzip_static  on;
  gzip_http_version 1.0;
  gzip_comp_level 2;
  gzip_proxied any;
  gzip_types application/x-javascript application/xhtml+xml application/xml application/xml+rss text/css text/javascript text/plain text/xml;
  gzip_vary on;
  gzip_disable "MSIE [1-6].(?!.*SV1)";

  client_max_body_size 4m;

  server_names_hash_bucket_size 64;

  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}'
  owner "root"
  group "root"
  mode 0644
end

service "nginx" do
  action [ :restart ]
end
