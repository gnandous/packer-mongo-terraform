variable "aws_region" {
  type = "string"
  default = ""
}

variable "env_name" {
  type = "string"
  default = "dev"
}


variable "amis" {
  type = "string"
  default = ""
}


variable "key_name" {
  default = ""
}

variable "subnet_id" {
  type = "string"
  default = ""
}

variable "vpc_id" {
  type = "string"
  default = ""
}
