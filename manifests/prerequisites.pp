# Class: hbase::prerequisites
#
# This class installs hbase prerequisites
#
# == Variables
#
# Refer to hbase class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by hbase if the parameter
# install_prerequisites is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class hbase::prerequisites {

  include java

  if $hbase::install != 'package' {
    file { "/etc/init.d/hbase":
      ensure  => present,
      mode    => 0755,
      owner   => $hbase::process_user,
      group   => $hbase::process_user,
      content => template($hbase::init_script_template),
      before  => Class['hbase::service'],
    }
  }
}
