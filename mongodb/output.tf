output "ip" {
  value = "${aws_instance.mongodb_one.private_ip}"
}
