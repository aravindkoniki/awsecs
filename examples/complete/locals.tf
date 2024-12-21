

locals {
  region = "eu-west-1"
  name   = "ecs_demo_cluster"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_1    = "10.0.16.0/20"
  public_subnet_2    = "10.0.32.0/20"
  private_subnet_1   = "10.0.80.0/20"
  private_subnet_2   = "10.0.112.0/20"
  availibilty_zone_1 = "eu-west-1a"
  availibilty_zone_2 = "eu-west-1b"

  container_name = "ecsdemo-frontend"
  container_port = 3000

  tags = {
    Name    = local.name
    Example = local.name
  }
}
