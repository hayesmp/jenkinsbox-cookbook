#
# Cookbook Name:: rackbox
# Recipe:: jenkins
#
# Install and setup Ruby environment
#

include_recipe "jenkins"

git_branch = 'master'
job_name = "sigar-#{node[:os]}-#{node[:kernel][:machine]}"

job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source "sigar-jenkins-config.xml"
  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies :update, resources(:jenkins_job => job_name), :immediately
  notifies :build, resources(:jenkins_job => job_name), :immediately
end