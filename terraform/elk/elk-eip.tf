#
# Bastion Elatic IP
#
resource "aws_eip" "elk_eip" {
  instance = "${aws_instance.elk-ec2.id}"
  vpc      = true
}
