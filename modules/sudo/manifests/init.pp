#
# Configure PasswordLess Sudo for Deployer
#
class sudo {

    file { "/etc/sudoers.d/deployer":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 440,
        source => "puppet:///modules/sudo/deployer",
    }

    file { "/etc/sudoers":
        owner => root,
        group => root,
        mode => 440,
        source => "puppet:///modules/sudo/sudoers"
    }

}
