#
# Cookbook:: MUSiCC
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update if node['platform_family'] == 'debian'
build_essential 'install essential' do
  action :install
end

include_recipe 'poise-python'

# install the Python runtime
python_runtime '2' do
  version '2.7'
end

# Need to specify this version otherwise MUSiCC will install but not run correctly
python_package 'scikit-learn' do
  version '0.17.1'
end

python_package 'MUSiCC' do
  version node['MUSiCC']['version']
end

# Workaround to allow non root user to run tests (they need to write to this dir)
directory '/usr/local/lib/python2.7/dist-packages/musicc/examples/' do
  mode 0777
end

magic_shell_environment 'MUSICC_VERSION' do
  value node['MUSiCC']['version']
end
