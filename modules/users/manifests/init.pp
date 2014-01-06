class users {

    user { 'deployer':
        ensure => 'present',
        groups => ['sudo'],
        home => '/home/deployer',
        managehome => true,
        password => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
        shell => '/bin/bash',
    }

    ssh_authorized_key { 'deployer':
        ensure => 'present',
        user => 'deployer',
        type => 'rsa',
        key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAwzJurskQS5PVpeOuCwDLnbpT7N4+6bdRQXNENGLmMfFZDEQnX3nO+OEnm8HgvA0q7jw8zVWND/US29DhDM1JeccyP7qqCwgzKBEXyjNhgygUKjreYeQ4dLYy5js9h7YN6Yoqmv0F1Iq9aU+IpXdNjTvJN8+tzxCknzBuOwQKJx8zTs+xCi4/y3xwb5+R1ZUNiR4wqTwpmVwRjxo4lzTkHquL8MnLhkwF7JyLVUSsmlje+A/qBiFlYlJGrip9DLVt0DUo6JQbMaVWppD2Hni05IGgIHFaUipdrZdfJOuhcup+gXu6UfX7mlBuz05533fZaLRE00lszxBFS8yFcoesYQ==',
    }
}
