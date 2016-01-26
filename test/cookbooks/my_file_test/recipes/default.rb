my_file '/hello.txt' do
  content "why hello there\n"
  action :create
end

execute 'touch /delete_me.txt' do
  action :run
  not_if { ::File.exist?('/marker_delete_me') }
end

file '/marker_delete_me' do
  action :create
end

my_file '/delete_me.txt' do
  action :delete
end
