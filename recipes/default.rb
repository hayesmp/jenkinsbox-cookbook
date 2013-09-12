#
# Cookbook Name:: rackbox
# Recipe:: default
#

include_recipe "appbox"
include_recipe "rackbox::jenkins"
include_recipe "rackbox::ruby"
