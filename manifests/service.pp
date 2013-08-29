# Class: hbase::service
#
# This class manages hbase service
#
# == Variables
#
# Refer to hbase class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by hbase
#
class hbase::service {

  case $hbase::install {

    package: {
      service { 'hbase':
        ensure     => $hbase::manage_service_ensure,
        name       => $hbase::service,
        enable     => $hbase::manage_service_enable,
        hasstatus  => $hbase::service_status,
        pattern    => $hbase::process,
        noop       => $hbase::bool_noops,
      }
    }

    source: {
      service { 'hbase':
        ensure     => $hbase::manage_service_ensure,
        name       => $hbase::service,
        enable     => $hbase::manage_service_enable,
        hasstatus  => $hbase::service_status,
        pattern    => $hbase::process,
        noop       => $hbase::bool_noops,
        provider   => 'init',
      }
    }

    default: { }

  }

}
