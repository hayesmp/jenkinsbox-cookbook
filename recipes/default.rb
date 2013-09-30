#
# Cookbook Name:: rackbox
# Recipe:: default
#

`hostname 0.0.0.0`

#package "mysql"

include_recipe "appbox"

include_recipe "java"
include_recipe "jenkins"


include_recipe "rackbox::jenkins"
include_recipe "rackbox::ruby"
