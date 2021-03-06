# == Class: awstats::params
#
# This class should be considered private
#
class awstats::params {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6', '7': {
          $package_name     = 'awstats'
          $config_dir_path  = '/etc/awstats'
          $default_template = "${module_name}/awstats.conf.erb"
        }
        default: {
          fail("Module ${module_name} is not supported on operatingsystemmajrelease ${::operatingsystemmajrelease}") # lint:ignore:80chars
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
