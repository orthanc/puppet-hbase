# Class: hbase::config
#
# This class manages hbase configuration
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
class hbase::config {

  file { 'hbase.conf':
    ensure  => $hbase::manage_file,
    path    => $hbase::real_config_file,
    mode    => $hbase::config_file_mode,
    owner   => $hbase::config_file_owner,
    group   => $hbase::config_file_group,
    source  => $hbase::manage_file_source,
    content => $hbase::manage_file_content,
    replace => $hbase::manage_file_replace,
    audit   => $hbase::manage_audit,
    noop    => $hbase::bool_noops
  }

  file { 'hbase.env.sh':
    ensure  => $hbase::manage_file,
    path    => $hbase::real_config_env_file,
    mode    => $hbase::config_file_mode,
    owner   => $hbase::config_file_owner,
    group   => $hbase::config_file_group,
    source  => $hbase::manage_file_env_source,
    content => $hbase::manage_file_env_content,
    replace => $hbase::manage_file_replace,
    audit   => $hbase::manage_audit,
    noop    => $hbase::bool_noops
  }

  # The whole hbase configuration directory can be recursively overriden
  if $hbase::source_dir {
    file { 'hbase.dir':
      ensure  => directory,
      path    => $hbase::real_config_dir,
      source  => $hbase::source_dir,
      recurse => true,
      purge   => $hbase::bool_source_dir_purge,
      force   => $hbase::bool_source_dir_purge,
      replace => $hbase::manage_file_replace,
      audit   => $hbase::manage_audit,
      noop    => $hbase::bool_noops,
    }
  }

}
