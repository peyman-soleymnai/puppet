

node 'client1.puppet' {
    class { 'linux':}

}

class linux {

  $admintool = [ 'ntpddd', 'nano', 'httpd']
    
  $httpservice = $osfamily ? {
    'redhat' => 'httpd',
    'debian' => 'apache2',
    default => 'httpd',
}


     package { $admintool:
        ensure => 'installed',
            }
                                      
                                              
     service { $httpservice:
        ensure  => running,
        require => Package['httpd'],
        enable => true,
             }
}
