# Class: java
#
# This class installs the java jre package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the java jre package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'java':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'java':
#      ensure => 'absent'
#    }
#
class java (
  $ensure = $::java::params::jre_package_ensure
) inherits ::java::params {
  package { $::java::params::jre_package:
    ensure  => $ensure,
  }

}
