class rsnapshot {
	define rsnapshot::host($host = false) {
		$t_hosts = $host ? {
			false   => $::hostname,
			default => $host,
		}

		file { "$name":
			owner   => root,
			group   => root,
			mode    => 0644,
			alias   => "rsnapshot.conf",
			content => template("rsnapshot/$::lsbdistcodename/etc/rsnapshot.conf.erb"),
			require => Package["rsnapshot"],
		}
	}

	file { "/etc/cron.d/rsnapshot":
		owner   => root,
		group   => root,
		mode    => 0644,
		source  => "puppet:///modules/rsnapshot/common/etc/cron.d/rsnapshot",
		require => [
			File["rsnapshot.conf"],
			Package["rsnapshot"]
		],
	}

	rsnapshot::host { "/etc/rsnapshot.conf":
		host => [
			"atlas",
			"epimetheus",
			"gaia",
			"hyperion",
			"iapetos",
			"koios",
			"kreios",
			"kronos",
			"menoitios",
			"mnemosyne",	
			"okeanos",
			"phoibe",
			"prometheus",
			"rhea",
			"tethys",
			"theia",
			"themis",
			"titan"
		],
	}

	package { "rsnapshot":
		ensure => present,
	}
}

# vim: tabstop=3