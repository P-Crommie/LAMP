variable "project" {
  type    = string
  default = "ansible"
}

variable "ec2_ami" {
  type    = string
  default = "ami-01dd271720c1ba44f"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "availability_zone" {
  type    = string
  default = "eu-west-1b"
}

variable "key_name" {
  type    = string
  default = "LAMP_key"
}

variable "ssh_allowed_cidr" {
  default = ["41.66.224.0/20"]
}

variable "user_home_directory" {
  default = "/home/crommie"
}
