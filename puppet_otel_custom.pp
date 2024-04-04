class otel {

  #$otel_group = lookup('otel_group', {'default_value' => 'group'})
  notify { "stdout: otel fact is ${::otel_group}": }
  #notify { "stdout: otel group is ${otel_group}": }
  $config_string = "--config=/etc/otelcol-contrib/otelfiles/base.yaml --config=/etc/otelcol-contrib/otelfiles/cpu.yaml --config=/etc/otelcol-contrib/otelfiles/exporters.yaml --config=/etc/otelcol-contrib/otelfiles/extensions.yaml --config=/etc/otelcol-contrib/otelfiles/processors.yaml --config=/etc/otelcol-contrib/otelfiles/group.yaml"
  
  service { 'otelcol-contrib':
    enable  => true,
    ensure => running,
    #subscribe => File['/etc/otelcol-contrib/otelcol-contrib.conf'],
    require => [
    File['/etc/otelcol-contrib/otelfiles/base.yaml'],
    File['/etc/otelcol-contrib/otelfiles/cpu.yaml'],
    File['/etc/otelcol-contrib/otelfiles/exporters.yaml'],
    File['/etc/otelcol-contrib/otelfiles/extensions.yaml'],
    File['/etc/otelcol-contrib/otelfiles/processors.yaml'],
    File['/etc/otelcol-contrib/otelcol-contrib.conf'],
  ],
  }
  
  file { '/opt/puppetlabs/facter/facts.d/otel_facts.yaml':
   ensure  => 'present',
    mode    => '0755',  # Optional: Set the desired permissions
    owner   => 'root',  # Optional: Set the desired owner
    group   => 'root', # Optional: Set the desired group
    source => [
     #   "http://adalton:8000/otel/host_group_subscription/${::hostname}.yaml",
     #   "http://adalton:8000/otel/base/otel_facts.yaml"
     "file:/otel_file_test/host_group_subscription/${::hostname}.yaml",
     "file:/otel_file_test/base/otel_facts.yaml"
     #"https://otel-test.s3.eu-west-2.amazonaws.com/host_group_subscription/${::hostname}.yaml",
     #"https://otel-test.s3.eu-west-2.amazonaws.com/base/otel_facts.yaml"
    ],
  }
  
  file { '/etc/otelcol-contrib/otelfiles':
    ensure  => 'directory',
    recurse => true,
    mode    => '0755',  # Optional: Set the desired permissions
    owner   => 'root',  # Optional: Set the desired owner
    group   => 'root', # Optional: Set the desired group
  }
  
  file { '/etc/otelcol-contrib/otelfiles/scripts':
    ensure  => 'directory',
    mode    => '0755',  # Optional: Set the desired permissions
    owner   => 'root',  # Optional: Set the desired owner
    group   => 'root', # Optional: Set the desired group
  }
  
  
  file { '/etc/otelcol-contrib/otelfiles/base.yaml':
    ensure => 'present',
    source => [
        #"puppet:///modules/otel/custom/base/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/base/groups/${otel_group}.yaml",
        #"puppet:///modules/otel/base/base.yaml"
        #"http://adalton:8000/otel/custom/base/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/base/groups/${otel_group}.yaml",
        #"http://adalton:8000/otel/base/base.yaml"
        "file:/otel_file_test/custom/base/${::hostname}.yaml",
        "file:/otel_file_test/custom/base/groups/${::otel_group}.yaml",
        "file:/otel_file_test/base/base.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  file { '/etc/otelcol-contrib/otelfiles/cpu.yaml':
    ensure => 'present',
    source => [
        #"puppet:///modules/otel/custom/cpu/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/cpu/groups/${otel_group}.yaml",
        #"puppet:///modules/otel/base/cpu.yaml"
        #"http://adalton:8000/otel/custom/cpu/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/cpu/groups/${otel_group}.yaml",
        #"http://adalton:8000/otel/base/cpu.yaml"
        "file:/otel_file_test/custom/cpu/${::hostname}.yaml",
        "file:/otel_file_test/custom/cpu/groups/${::otel_group}.yaml",
        "file:/otel_file_test/base/cpu.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  file { '/etc/otelcol-contrib/otelfiles/exporters.yaml':
    ensure => 'present',
    source => [
        #"puppet:///modules/otel/custom/exporters/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/exporter/groups/${otel_group}.yaml",
        #"puppet:///modules/otel/base/exporters.yaml"
        #"http://adalton:8000/otel/custom/exporters/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/exporters/groups/${otel_group}.yaml",
        #"http://adalton:8000/otel/base/exporters.yaml"
        "file:/otel_file_test/custom/exporters/${::hostname}.yaml",
        "file:/otel_file_test/custom/exporters/groups/${::otel_group}.yaml",
        "file:/otel_file_test/base/exporters.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  file { '/etc/otelcol-contrib/otelfiles/extensions.yaml':
    ensure => 'present',
    source => [
        #"puppet:///modules/otel/custom/extensions/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/extensions/groups/${otel_group}.yaml",
        #"puppet:///modules/otel/base/extensions.yaml"
        #"http://adalton:8000/otel/custom/extensions/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/extensions/groups/${otel_group}.yaml",
        #"http://adalton:8000/otel/base/extensions.yaml"
        "file:/otel_file_test/custom/extensions/${::hostname}.yaml",
        "file:/otel_file_test/custom/extensions/groups/${::otel_group}.yaml",
        "file:/otel_file_test/base/extensions.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  file { '/etc/otelcol-contrib/otelfiles/processors.yaml':
    ensure => 'present',
    source => [
        #"puppet:///modules/otel/custom/processors/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/processors/groups/${otel_group}.yaml",
        #"puppet:///modules/otel/base/processors.yaml"
        #"http://adalton:8000/otel/custom/processors/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/processors/groups/${otel_group}.yaml",
        #"http://adalton:8000/otel/base/processors.yaml"
        "file:/otel_file_test/custom/processors/${::hostname}.yaml",
        "file:/otel_file_test/custom/processors/groups/${::otel_group}.yaml",
        "file:/otel_file_test/base/processors.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  file { '/etc/otelcol-contrib/otelfiles/group.yaml':
    ensure => 'file',
    source => [
        #"puppet:///modules/otel/custom/${otel_group}/${::hostname}.yaml",
        #"puppet:///modules/otel/custom/${otel_group}/${otel_group}.yaml",
        #"puppet:///modules/otel/custom/no_otel_group_config.yaml"
        #"http://adalton:8000/otel/custom/${::otel_group}/${::hostname}.yaml",
        #"http://adalton:8000/otel/custom/${::otel_group}/${::otel_group}.yaml",
        #"http://adalton:8000/otel/custom/no_otel_group_config.yaml"
        "file:/otel_file_test/custom/${::otel_group}/${::hostname}.yaml",
        "file:/otel_file_test/custom/${::otel_group}/${::otel_group}.yaml",
        "file:/otel_file_test/custom/no_otel_group_config.yaml"
    ],
    notify => Service['otelcol-contrib'],
    before => Service['otelcol-contrib'],
  }
  
  #$new_config_string = "${config_string} --config=/etc/otelcol-contrib/otelfiles/${otel_group}.yaml"
  
  #notify { "running terraform if statement": }
  #if $otel_group == 'terraform' {
  
  
    #file { '/etc/otelcol-contrib/otelfiles/terraform.yaml':
        #ensure => 'present',
       # source => [
        #    "puppet:///modules/otel/custom/terraform/terraform.yaml"
      #  ],
      #  notify => Service['otelcol-contrib'],
      #  before => [
      #  Service['otelcol-contrib'],
      #  File['/etc/otelcol-contrib/otelcol-contrib.conf'],
      #  ],
   # }
    
    #$config_string = generate('/etc/otelcol-contrib/otelfiles/scripts/build_config_string.sh')
    #$config_string += " --config=/etc/otelcol-contrib/otelfiles/terraform.yaml"
    #$config_string = concat($config_string, ' --config=/etc/otelcol-contrib/otelfiles/terraform.yaml')
    #$new_config_string = "${config_string} --config=/etc/otelcol-contrib/otelfiles/terraform.yaml"

    #notify { "otel group is tf:  ${new_config_string}": }
    
    
  #} else {
  

   # file { '/etc/otelcol-contrib/otelfiles/terraform.yaml':
    #    ensure => 'absent',    
   #     before => [
   #     Service['otelcol-contrib'],
   #     File['/etc/otelcol-contrib/otelcol-contrib.conf'],
   #     ],
   # }
    
    #$config_string = generate('/etc/otelcol-contrib/otelfiles/scripts/build_config_string.sh')
   # notify { "otel group is not tf:  ${new_config_string}": }
   # $new_config_string=$config_string
#  }    

  
  
  
  notify { "running otelcol-contrib.conf": }
  file { '/etc/otelcol-contrib/otelcol-contrib.conf':
    content => template('otel/otelcol-contrib.conf.erb'),
    ensure => 'present',
    mode => '0755',
    notify => Service['otelcol-contrib'],
    before => [
        Service['otelcol-contrib'],
    ],
  }
   
   
}
