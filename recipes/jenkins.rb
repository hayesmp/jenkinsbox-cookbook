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

#`git config --global user.name "Your Name Here"`
#`git config --global user.email "your_email@example.com"`

#`hostname 0.0.0.0`
`wget -O default.js http://updates.jenkins-ci.org/update-center.json`
`sed '1d;$d' default.js > default.json`
`mkdir /var/lib/jenkins/updates`
`mv default.json /var/lib/jenkins/updates/`
`chown -R jenkins:nogroup /var/lib/jenkins/updates`

jenkins_cli "safe-restart"

jenkins_cli "install-plugin github"
#jenkins_cli "install-plugin rbenv" #don't need
#jenkins_cli "install-plugin envinject" don't need

# If we were going to make this work we would need to:
# 1) Install a plugin that allows for user account creating
# 2) Create a user account with the CLI

# Jenkins build script
# PATH=/opt/rbenv/shims:/opt/rbenv/bin:/opt/rbenv/plugins/ruby_build/bin:${PATH}
# bundle install
# bundle exec rake

#jenkins_cli "safe-restart"

#node["rackbox"]["jenkins"]["git_repo"]
#node["rackbox"]["jenkins"]["command"]
#node["rackbox"]["jenkins"]["job"]
#node["rackbox"]["jenkins"]["ip_address"]

git_branch = 'master'
job_name = node["rackbox"]["jenkins"]["job"]

job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

#jenkins_job job_name do
#  action :create
#  config job_config
#end
#
#template job_config do
#  source "jenkins_job-config.xml.erb"
#  #variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
#  #notifies :update, resources(:jenkins_job => job_name), :immediately
#  #notifies :build, resources(:jenkins_job => job_name), :immediately
#end

#`mkdir /var/lib/jenkins/jobs/#{job_name}`
#``

#jenkins_cli "create-job #{job_name} < "

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

#`hostname #{host}`
