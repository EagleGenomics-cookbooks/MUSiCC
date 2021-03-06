#
# Cookbook:: MUSiCC
# Recipe:: default
#
# Copyright:: 2019, Eagle Genomics Ltd, All Rights Reserved.

apt_update if node['platform_family'] == 'debian'
build_essential 'install essential' do
  action :install
end

include_recipe 'python_setup'

pyenv_pip 'numpy' do
  version '1.17.0'
end

pyenv_pip 'scipy' do
  version '1.3.0'
end

# Need to specify this version otherwise MUSiCC will install but not run correctly
pyenv_pip 'scikit-learn' do
  version '0.21.3'
end

pyenv_pip 'pandas' do
  version '0.25.0'
end

pyenv_pip 'MUSiCC' do
  version node['MUSiCC']['version']
end

# Workaround to allow non root user to run tests (they need to write to this dir)
directory '/usr/local/pyenv/versions/3.7.2/lib/python3.7/site-packages/musicc/examples/' do
  mode 0777
end

magic_shell_environment 'MUSICC_VERSION' do
  value node['MUSiCC']['version']
end
