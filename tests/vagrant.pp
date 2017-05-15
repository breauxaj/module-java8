node default {
  include ::java
  include ::java::devel

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

}