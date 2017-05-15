# Class: java::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class java::params {
  $jdk_package_ensure = 'latest'
  $jre_package_ensure = 'latest'

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
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
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
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
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
