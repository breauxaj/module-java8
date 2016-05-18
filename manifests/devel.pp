# Class: java::devel
#
# This class installs the java jdk package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java jdk package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java::devel':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'java::devel':
#      ensure => 'absent'
#    }
#
class java::devel (
  $ensure = 'latest'
) inherits ::java::params {
  package { $::java::params::jdk_package:
    ensure  => $ensure,
  }

}
