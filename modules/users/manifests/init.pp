class users {

    $ssh = hiera('ssh', false)

    if !is_hash($ssh) {
        fail('SSH Configuration not found in hierdata providers')
    }

    $user = $ssh['user']

    user { $ssh['user']:
        ensure => 'present',
        groups => ['sudo'],
        home => "/home/{$user}",
        managehome => true,
        password => $ssh['password'],
        shell => '/bin/bash',
    }

    ssh_authorized_key { $user :
        ensure => 'present',
        user => $user,
        type => 'rsa',
        key => $ssh['public_key'],
    }

}
