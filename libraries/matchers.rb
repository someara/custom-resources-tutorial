if defined?(ChefSpec)

  def create_my_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:my_file, :create, resource_name)
  end

end
