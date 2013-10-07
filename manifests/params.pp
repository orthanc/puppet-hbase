# Class: hbase::params
#
# This class defines default parameters used by the main module class hbase
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to hbase class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class hbase::params {

  ### Application related parameters
  $install_prerequisites = true
  $install               = 'source'

  $install_source        = ''
  $install_destination   = '/opt'
  $init_config_template  = 'hbase/hbase.conf.erb'
  $init_script_template  = 'hbase/hbase.init.erb'
  $config_file_env_template = 'hbase/hbase-env.sh.erb'

  $package = $::operatingsystem ? {
    default => 'hbase',
  }

  $service = $::operatingsystem ? {
    default => 'hbase',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'hbase',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'hbase',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/hbase',
  }

  $config_file = $::operatingsystem ? {
    default => '',
  }

  $config_env_file = $::operatingsystem ? {
    default => '',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'hbase',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'hbase',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/hbase',
    default                   => '/etc/sysconfig/hbase',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/hbase-hbase-master.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/hbase',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/hbase',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/hbase/hbase.log',
  }

  $root_dir = $::operatingsystem ? {
    default => '/opt/hbasedata',
  }

  $java_home = $::operatingsystem ? {
    default => '/usr/lib/jvm/default-java/'
  }

  $port = '9000'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $config_file_env_source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'hbase/hbase-site.xml.erb'
  $options = ''
  $service_autorestart = true
  $version = '0.94.12'
  $absent = false
  $disable = false
  $disableboot = false
  $create_user = true
  $java_heapsize = 1000
  $java_opts = '-XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode'

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
