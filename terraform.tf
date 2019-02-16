# RDS
resource "aws_db_instance" "rds" {
  allocated_storage = 10
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "mydb"
  username  = "foo"
  password  = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
}

# S3


# EC2


# ECS


# Transcoder

