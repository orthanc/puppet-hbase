# Class: hbase::user
#
# This class creates hbase user
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by hbase
#
class hbase::user {
  @user { $hbase::process_user :
    ensure     => $hbase::manage_file,
    comment    => "${hbase::process_user} user",
    password   => '!',
    managehome => false,
    home       => $hbase::home,
    shell      => '/bin/bash',
  }

  User <| title == $hbase::process_user |>

}
