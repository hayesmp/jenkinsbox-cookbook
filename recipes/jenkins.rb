#
# Cookbook Name:: rackbox
# Recipe:: jenkins
#
# Install and setup Jenkins environment
#
#include_recipe "apt"
include_recipe "java"
include_recipe "jenkins"


ip_address = node["rackbox"]["jenkins"]["ip_address"]
host = node["rackbox"]['jenkins']['host']
puts host

#`hostname 0.0.0.0`
`wget -O default.js http://updates.jenkins-ci.org/update-center.json`
`sed '1d;$d' default.js > default.json`
`mkdir /var/lib/jenkins/updates`
`mv default.json /var/lib/jenkins/updates/`
`chown -R jenkins:nogroup /var/lib/jenkins/updates`

jenkins_cli "safe-restart"

jenkins_cli "install-plugin github"

#jenkins_cli "safe-restart"

#node["rackbox"]["jenkins"]["git_repo"]
#node["rackbox"]["jenkins"]["command"]
#node["rackbox"]["jenkins"]["job"]
#node["rackbox"]["jenkins"]["ip_address"]

git_branch = 'master'
job_name = node["rackbox"]["jenkins"]["job"]

job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source "jenkins_job-config.xml.erb"
  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies :update, resources(:jenkins_job => job_name), :immediately
  notifies :build, resources(:jenkins_job => job_name), :immediately
end


=begin
git_branch = 'master'
job_name = node["rackbox"]["jenkins"]["job"]

#job_config = File.open("jenkins_job-config.xml", "w")
job_config = "jenkins_job-config.xml"

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source "jenkins_job-config.xml.erb"
  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies :update, resources(:jenkins_job => job_name), :immediately
  notifies :build, resources(:jenkins_job => job_name), :immediately
end
=end

`hostname #{host}`
