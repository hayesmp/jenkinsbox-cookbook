#
# Cookbook Name:: rackbox
# Recipe:: default
#

`hostname 0.0.0.0`

include_recipe "appbox"

include_recipe "java"
include_recipe "jenkins"


include_recipe "rackbox::jenkins"
include_recipe "rackbox::jenkins_setup"
include_recipe "rackbox::ruby"
