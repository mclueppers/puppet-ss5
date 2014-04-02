class ss5 (
	$ss5_port	= "1080",
	$ss5_user	= "nobody",
	$ss5_bindaddr   = "0.0.0.0",	
	$auth_list	= [],
	$proxy_list	= [],
	$noproxy_list	= [],
	$bandwidth_list = [],
	$dump_list	= [],
	$permit_list	= [],
	$deny_list	= [],
	$virtual_list	= []
) inherits ::ss5::params {
	package { $package_name: ensure => installed }

	service { $service_name:
		enable    => true,
		ensure    => running,
		restart   => "service ${service_name} restart",
		path      => ['/sbin', '/usr/sbin'],
		hasstatus => true,
		require   => Package[$package_name],
	}

	file { $config_file:
		require => Package[$package_name],
		notify  => Service[$service_name],
		content => template('ss5/ss5.conf.erb'),
	}

	file { $sysconfig_file:
		require => File[$config_file],
		notify  => Service[$service_name],
		content => template('ss5/ss5.sysconfig.erb'),
	}
}
