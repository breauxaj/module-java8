node default {
  include ::java8
  include ::java8::devel

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

}
