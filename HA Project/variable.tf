# default.tf variable 
variable vpc_cidr {
  type        = string
  description = "vpc_cidr"
}

variable pub_sub_cidr {
  type        = list
  description = "list of tow public subnet cider "
}

variable priv_sub_cidr {
  type        = list
  description = "list of tow privater subnet cider "
}

variable  availability_zone {
  type        = list
  description = "list of tow availability_zone  "
}


# ec2.tf variable 
variable ec2_ami {
  type        = string
  description = "ami for amazon ec2 "
}

variable ec2_type {
  type        = string
  description = "type for amazon ec2"
}

variable ec2_key {
  type        = string
  description = "key for amazon ec2"
}


# route_table.tf variable
variable cidr_all {
  type        = string
  description = "cidr for all ip "
}


