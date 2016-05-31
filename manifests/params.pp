# Class: java::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class java::params {
  case $::osfamily {
    'Debian': {
      case $::operatingsystemmajrelease {
        '8': {
          $jdk_package = 'openjdk-7-jdk'
          $jre_package = 'openjdk-7-jre'
    
          file { '/etc/profile.d/java.sh':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            content => template('java/profile.erb'),
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem}${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          $jdk_package = 'java-1.6.0-openjdk-devel'
          $jre_package = 'java-1.6.0-openjdk'
          
          file { '/etc/profile.d/java.sh':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            content => template('java/profile.erb'),
          }
        }
        '7': {
          $jdk_package = 'java-1.7.0-openjdk-devel'
          $jre_package = 'java-1.7.0-openjdk'

          file { '/etc/profile.d/java.sh':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            content => template('java/profile.erb'),
          }
        }
        '2016': {
          $jdk_package = 'java-1.7.0-openjdk-devel'
          $jre_package = 'java-1.7.0-openjdk'
    
          file { '/etc/profile.d/java.sh':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            content => template('java/profile.erb'),
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem}${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}