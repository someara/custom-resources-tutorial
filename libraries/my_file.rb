class MyFile < Chef::Resource
  resource_name :my_file

  property :path, String, name_property: true
  property :content, String

  action :create do
    file path do
      content new_resource.content
      action :create
    end
  end

  action :delete do
    file path do
      action :delete
    end
  end
end
