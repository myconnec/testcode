# RDS

resource "aws_db_instance" "rds" {
  allocated_storage       = 10
  backup_retention_period = 14
  backup_window           = "04:00-04:30"
  copy_tags_to_snapshot   = true
  deletion_protection     = "${var.APP_ENV == "www" ? true :false}"
  engine                  = "mariadb"
  engine_version          = "10.3"
  identifier              = "connechub-${var.APP_ENV}"
  instance_class          = "db.t2.micro"
  maintenance_window      = "Sun:04:30-Sun:05:00"
  name                    = "connechub"
  parameter_group_name    = "default.mariadb10.3"
  password                = "${var.DB_PASS}"
  publicly_accessible     = "${var.APP_ENV == "www" ? false : true}"
  skip_final_snapshot     = "${var.APP_ENV == "www" ? false : true}"
  storage_type            = "gp2"
  username                = "${var.DB_USER}"

  tags = {
    app     = "connechub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "RDS"
    tech    = "MariaDB"
  }

  vpc_security_group_ids = [
    "${aws_security_group.mysql.id}",
  ]
}
