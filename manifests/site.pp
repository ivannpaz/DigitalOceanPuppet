class server_config {

    #forge modules
    include ::stdlib
    include ::ntp
    include ::apt
    include ::ruby
    #include ::nodejs
    include php::fpm

    #server specific configs
    include sudo
    include users
    include ssh
    include git
    include nginx

}

include server_config
