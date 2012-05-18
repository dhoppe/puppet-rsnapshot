define rsnapshot::host($hosts) {
  file { $name:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    alias   => 'rsnapshot.conf',
    content => template("rsnapshot/${::lsbdistcodename}/etc/rsnapshot.conf.erb"),
    require => Package['rsnapshot'],
  }
}