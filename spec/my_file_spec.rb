require 'spec_helper'

describe 'my_file_test::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'compiles the resource_collection' do
    expect(chef_run).to create_my_file('/hello.txt').with(
      content: "why hello there\n"
    )

    expect(chef_run).to run_execute('touch /delete_me.txt')
    expect(chef_run).to create_file('/marker_delete_me')
    expect(chef_run).to delete_my_file('/delete_me.txt')
  end
end
