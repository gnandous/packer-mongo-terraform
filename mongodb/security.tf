# MongoDB security group
resource "aws_security_group" "mongodb" {
  name        = "mongodb-${var.env_name}"
  description = "Security group for mongodb-${var.env_name}"
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "mongodb-${var.env_name}"
  }
}

resource "aws_security_group_rule" "mongodb_allow_all" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_mongodb" {
  type            = "ingress"
  from_port       = 27017
  to_port         = 27017
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_mongodb_replication" {
  type            = "ingress"
  from_port       = 27019
  to_port         = 27019
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}
