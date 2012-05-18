class rsnapshot (
  $host = $rsnapshot::params::host
) inherits rsnapshot::params {

  validate_array(hiera('host'))

  file { '/etc/cron.d/rsnapshot':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/rsnapshot/common/etc/cron.d/rsnapshot',
    require => [
      File['rsnapshot.conf'],
      Package['rsnapshot']
    ],
  }

  rsnapshot::host { '/etc/rsnapshot.conf':
    hosts => $host,
  }

  package { 'rsnapshot':
    ensure => present,
  }
}