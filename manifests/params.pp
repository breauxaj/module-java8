# Class: java8::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class java8::params {
  $jdk_package_ensure = 'latest'
  $jre_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              $jdk_package = 'java-1.8.0-openjdk-devel'
              $jre_package = 'java-1.8.0-openjdk'

              file { '/etc/profile.d/java8.sh':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                content => template('java8/profile.erb'),
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
