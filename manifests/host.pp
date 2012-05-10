define rsnapshot::host($host = false) {
  $t_hosts = $host ? {
    false   => $::hostname,
    default => $host,
  }

  file { $name:
    owner   => root,
    group   => root,
    mode    => '0644',
    alias   => 'rsnapshot.conf',
    content => template("rsnapshot/${::lsbdistcodename}/etc/rsnapshot.conf.erb"),
    require => Package['rsnapshot'],
  }
}