#
# Ensure git is present
#
class git {

    include git::install

}

class git::install {

    package { 'git:':
        ensure => present
    }

}
