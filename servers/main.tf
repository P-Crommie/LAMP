module "nodes" {
  source                    = "./infrastructure/compute"
  ec2_ami                   = var.ec2_ami
  ec2_type                  = var.ec2_type
  user_home_directory       = var.user_home_directory
  project                   = var.project
  key_name                  = var.key_name
  availability_zone         = var.availability_zone
  nodes_subnet              = module.network.nodes_subnet
  vpc_id                    = module.network.vpc_id
  ssh_security_group        = module.network.ssh_security_group
  frontend_security_group   = module.network.frontend_security_group
  db_security_group         = module.network.db_security_group
  go_outside_security_group = module.network.go_outside_security_group
}


module "network" {
  source            = "./infrastructure/network"
  project           = var.project
  ssh_allowed_cidr  = var.ssh_allowed_cidr
  availability_zone = var.availability_zone
  subnet_cidr_bits  = var.subnet_cidr_bits
  vpc_cidr          = var.vpc_cidr
}


