class rsnapshot {
  validate_array(hiera('host'))

  file { '/etc/cron.d/rsnapshot':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/rsnapshot/common/etc/cron.d/rsnapshot',
    require => [
      File['rsnapshot.conf'],
      Package['rsnapshot']
    ],
  }

  rsnapshot::host { '/etc/rsnapshot.conf':
    host => hiera('host'),
  }

  package { 'rsnapshot':
    ensure => present,
  }
}