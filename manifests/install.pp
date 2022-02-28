class havp::install inherits havp {

  include ::clamav

  if($havp::manage_package)
  {
    package { $havp::params::package_name:
      ensure => $havp::package_ensure,
      require => Class['clamav'],
    }
  }

}
