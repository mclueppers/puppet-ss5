# mdobrev-ss5 #

A module to install and configure SS5 SOCKS [proxy](http://ss5.sourcefourge.net/). You need to build your own RPMs
in order to use this module.

# Examples #

```puppet
	class { "::ss5": }
```

Change running port, disable authentication and permit connections from 10.0.0.0/8 only.

```puppet
	class { "::ss5":
                ss5_port        => "3129",
                auth_list       => [ "0.0.0.0/0               -               -" ],
                permit_list     => [ "-        10.0.0.0/8        -       0.0.0.0/0       -       -       -       -       -" ],
        }
```
