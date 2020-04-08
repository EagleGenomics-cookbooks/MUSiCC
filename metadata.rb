name 'MUSiCC'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures MUSiCC'
long_description 'Installs/Configures MUSiCC'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/EagleGenomics-cookbooks/MUSiCC/issues'
source_url 'https://github.com/EagleGenomics-cookbooks/MUSiCC'

depends 'magic_shell'
depends 'poise-python'
