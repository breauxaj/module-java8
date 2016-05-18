# Class: java::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class java::params {
  case $::operatingsystem {
    'centos','redhat': {
      case $::java_version {
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
        default: {
          fail("Unsupported version: ${::java_version}")
        }
      }
    }
    'debian': {
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
      fail("Unsupported version: ${::operatingsystem}")
    }
  }

}
