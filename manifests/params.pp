class rsnapshot::params {
  case $::lsbdistcodename {
    'squeeze', 'natty': {
      $host = hiera('host')
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
