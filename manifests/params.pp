class ss5::params {
	case $::osfamily {
		'RedHat': {
			if $::operatingsystemrelease < 6 {
				$package_name = 'ss5'
			} else {
      				$package_name = 'ss5'
      			}
      			$service_name      = 'ss5'
			$config_dir	   = '/etc/opt/ss5'
      			$config_file       = "${config_dir}/ss5.conf"
      			$log_directory     = '/var/log/ss5'
			$sysconfig_file    = '/etc/sysconfig/ss5'
			$ss5_log_file	   = "${log_directory}/${service_name}.log"
			$ss5_password_file = "${config_dir}/${service_name}.passwd"
			$ss5_peers_file    = "${config_dir}/${service_name}.ha"
    		}
		default: {
                        if $::operatingsystemrelease < 6 {
                                $package_name = 'ss5'
                        } else {
                                $package_name = 'ss5'
                        }
                        $service_name  = 'ss5'
                        $config_file   = '/etc/opt/ss5/ss5.conf'
                        $log_directory = '/var/log/ss5'
			$sysconfig_file = '/etc/sysconfig/ss5'
                }
	}
}
