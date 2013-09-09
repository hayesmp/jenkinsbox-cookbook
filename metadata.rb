name             "rackbox"
maintainer       "Huiming Teo"
maintainer_email "teohuiming@gmail.com"
license          "Apache License 2.0"
description      "Setup a rack-based application server to run unicorn and passenger apps."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

recipe "rackbox", "run all recipes."
recipe "rackbox::ruby", "setup a ruby version manager `rbenv`."
recipe "rackbox::jenkins", "setup jenkins with a new job"

supports 'ubuntu'
supports 'debian'

depends 'appbox'
depends 'apt'
depends 'java'
depends 'jenkins'
depends 'jenkins::server'
