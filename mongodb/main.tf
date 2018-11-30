provider "aws" {
  region = ""
}


data "aws_ami" "mongodb-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["mongodb-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# EC2 Instance: MongoDB 1
resource "aws_instance" "mongodb_one" {
    availability_zone = "${var.aws_region}a"

    tags {
        Name = "mongodb-${var.env_name}"
    }

    ami = "${data.aws_ami.mongodb-ami.id}"

    instance_type = "t2.micro"

    security_groups = [
        "${aws_security_group.mongodb.id}"
    ]

    key_name = "${var.key_name}"
    subnet_id = "${data.terraform_remote_state.dev-infra.private_subnets[0]}"
}