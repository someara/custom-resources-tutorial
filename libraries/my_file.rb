class MyFile < Chef::Resource
  resource_name :my_file

  property :path, String, name_property: true
  property :content, String

  load_current_value do
    current_value_does_not_exist! unless ::File.exist?(path)
    content IO.read(path)
  end

  action :create do
    converge_if_changed do
      IO.write(path, content)
    end
  end
end
