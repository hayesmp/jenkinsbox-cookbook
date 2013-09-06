#
# Cookbook Name:: rackbox
# Recipe:: jenkins
#
# Install and setup Jenkins environment
#
#include_recipe "apt"
include_recipe "jenkins"

`wget -O default.js http://updates.jenkins-ci.org/update-center.json`
`sed '1d;$d' default.js > default.json`
`mkdir /var/lib/jenkins/updates`
`mv default.json /var/lib/jenkins/updates/`
`chown -R jenkins:nogroup /var/lib/jenkins/updates`

%w{ git github }.each do |plugin|
  `java -jar /home/jenkins/jenkins-cli.jar -s http://192.237.186.174:8080 install-plugin #{plugin}`
  #jenkins_cli "install-plugin #{plugin}"
  #jenkins_cli "safe-restart"
end

`service jenkins restart`



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
