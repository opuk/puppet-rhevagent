# == Class: rhevagent
#
# This module installs and enables the RHEV agent.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*rhev_agent_ensure*]
#   Ensure the agent is running or not.
#
# === Authors
#
# Johan Swensson <kupo@kupo.se>
#
# === Copyright
#
# Copyright 2015 Johan Swensson, unless otherwise noted.
#
class rhevagent (
  $rhev_agent_ensure = 'running',
) {

  if $::operatingsystemrelease >= 7 {
    package { 'ovirt-guest-agent-common':
      ensure  => installed,
    }
    service { 'ovirt-guest-agent':
      ensure  => $rhev_agent_ensure,
      enable  => true,
      require => Package['ovirt-guest-agent-common'],
    }
  } else {
    package { 'rhevm-guest-agent':
      ensure => installed,
    }
    service { 'ovirt-guest-agent':
      ensure  => $rhev_agent_ensure,
      enable  => true,
      require => Package['rhevm-guest-agent'],
    }
  }

}
