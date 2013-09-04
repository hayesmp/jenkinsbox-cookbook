#
# Cookbook Name:: rackbox
# Recipe:: default
#
#package "libsqlite3-dev"
#package "libpq-dev"
#package "postgresql"

include_recipe "appbox"
include_recipe "jenkins"
#include_recipe "mysql"
#include_recipe "sqlite"
#include_recipe "postgresql"
#include_recipe "nodejs" #to cut down on compile time
include_recipe "rackbox::ruby"
#include_recipe "rackbox::nginx"
#include_recipe "runit"

#if node["rackbox"]["apps"]["unicorn"]
#  include_recipe "rackbox::unicorn"
#end
#
#if node["rackbox"]["apps"]["passenger"]
#  include_recipe "rackbox::passenger"
#end
