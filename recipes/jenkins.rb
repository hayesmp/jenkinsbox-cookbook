#
# Cookbook Name:: rackbox
# Recipe:: jenkins
#
# Install and setup Jenkins environment
#
include_recipe "apt"
include_recipe "jenkins"

%w{ git github }.each do |plugin|
  jenkins_cli "install-plugin #{plugin}"
  jenkins_cli "safe-restart"
end


#node["rackbox"]["jenkins"]["git_repo"]
#node["rackbox"]["jenkins"]["command"]
#node["rackbox"]["jenkins"]["job"]


#git_branch = 'master'
#job_name = node["rackbox"]["jenkins"]["job"]
#
#job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")
#
#jenkins_job job_name do
#  action :nothing
#  config job_config
#end
#
#template job_config do
#  source "sigar-jenkins-config.xml"
#  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
#  notifies :update, resources(:jenkins_job => job_name), :immediately
#  notifies :build, resources(:jenkins_job => job_name), :immediately
#end
