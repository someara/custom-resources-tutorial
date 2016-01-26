describe file('/hello.txt') do
  it { should exist }
  it { should be_file }
  its('content') { should match "why hello there\n" }
end
