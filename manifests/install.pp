# Class: hbase::install
#
# This class installs hbase
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
class hbase::install {

  case $hbase::install {

    package: {

      if ($hbase::package_source != '') or ($hbase::package_source == undef) {
        case $hbase::package_source {
          /^http/: {
            exec {
              "wget hbase package":
                command => "wget -O ${hbase::real_package_path} ${hbase::package_source}",
                creates => "${hbase::real_package_path}",
                unless  => "test -f ${hbase::real_package_path}",
                before  => Package['hbase']
            }
          }
          /^puppet/: {
            file {
              'hbase package':
                path    => "${hbase::real_package_path}",
                ensure  => $hbase::manage_file,
                source  => $hbase::package_source,
                before  => Package['hbase']
            }
          }
          default: {}
        }
      }

      package { 'hbase':
        ensure    => $hbase::manage_package,
        name      => $hbase::package,
        provider  => $hbase::real_package_provider,
        source    => $hbase::real_package_path,
        noop      => $hbase::bool_noops,
      }
    }

    source: {
      if $hbase::bool_create_user == true {
        require hbase::user
      }
      puppi::netinstall { 'netinstall_hbase':
        url                 => $hbase::real_install_source,
        destination_dir     => $hbase::install_destination,
        owner               => $hbase::process_user,
        group               => $hbase::process_user,
        noop                => $hbase::bool_noops,
      }

      file { 'hbase_link':
        ensure => "${hbase::home}" ,
        path   => "${hbase::install_destination}/hbase",
        noop   => $hbase::bool_noops,
      }
    }

    default: { }

  }

  file { 'hbase.data.dir':
    ensure  => directory,
    path    => $hbase::root_dir,
    owner   => $hbase::config_file_owner,
    group   => $hbase::config_file_group,
    audit   => $hbase::manage_audit,
    noop    => $hbase::bool_noops,
  }
}
