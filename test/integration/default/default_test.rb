# # encoding: utf-8

# Inspec test for recipe MUSiCC::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
# Check the run MUSiCC script is installed
describe command('which run_musicc.py') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/run_musicc.py} }
end

# Check that MUSiCC test script is installed
describe command('which test_musicc.py') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/test_musicc.py} }
end

# Run the MUSiCC test script
describe command('test_musicc.py') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(/Running time was/) }
  its('stderr') { should match(/OK/) }
end

