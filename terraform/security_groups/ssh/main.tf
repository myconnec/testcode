resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Enable SSH traffic."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.INGRESS}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.EGRESS}"
    self        = true
  }

  tags = "${var.TAGS}"
}
