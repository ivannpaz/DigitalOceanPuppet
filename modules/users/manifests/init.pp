class users {

    user { 'deployer':
        ensure => 'present',
        groups => ['sudo'],
        home => '/home/deployer',
        managehome => true,
        password => '-disallowed-',
        shell => '/bin/bash',
    }

    $ssh = hiera('ssh', false)

    ssh_authorized_key { 'deployer':
        ensure => 'present',
        user => 'deployer',
        type => 'rsa',
        key => $ssh['public_key'],
    }

}
