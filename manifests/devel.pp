# Class: java8::devel
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
#    class { 'java8::devel':
#      ensure => 'absent'
#    }
#
class java8::devel (
  $ensure = $::java8::params::jdk_package_ensure
) inherits ::java8::params {
  package { $::java8::params::jdk_package:
    ensure  => $ensure,
  }

}
