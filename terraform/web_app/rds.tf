# RDS

resource "aws_db_instance" "rds" {
  allocated_storage     = 10
  copy_tags_to_snapshot = true
  deletion_protection   = "${var.APP_ENV == "prd" ? true : false}"
  engine                = "mariadb"
  engine_version        = "10.3"
  identifier            = "connechub-${var.APP_ENV}"
  instance_class        = "db.t2.micro"
  name                  = "connechub_${var.APP_ENV}"
  skip_final_snapshot   = "${var.APP_ENV == "prd" ? false : true}"
  storage_type          = "gp2"
  username              = "${var.DB_USER}"
  password              = "${var.DB_PASS}"
  parameter_group_name  = "default.mariadb10.3"

  tags = {
    app     = "${var.APP_NAME}"
    env     = "${var.APP_ENV}"
    owner   = "${var.CONTACT_EMAIL}"
    service = "RDS"
    tech    = "MariaDB"
  }

  vpc_security_group_ids = [
    "${aws_security_group.mysql.id}",
  ]
}
