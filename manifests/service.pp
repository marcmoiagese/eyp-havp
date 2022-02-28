class havp::service inherits havp {

  #
  validate_bool($havp::manage_docker_service)
  validate_bool($havp::manage_service)
  validate_bool($havp::service_enable)

  validate_re($havp::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${havp::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $havp::manage_docker_service)
  {
    if($havp::manage_service)
    {
      service { $havp::params::service_name:
        ensure => $havp::service_ensure,
        enable => $havp::service_enable,
      }
    }
  }
}
