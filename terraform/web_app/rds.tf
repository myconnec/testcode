# RDS

resource "aws_db_instance" "rds" {
  allocated_storage     = 10
  copy_tags_to_snapshot = true
  storage_type          = "gp2"
  engine                = "mariadb"
  engine_version        = "10.3"
  instance_class        = "db.t2.micro"
  name                  = "connechub_${var.APP_ENV}"
  identifier            = "connechub-${var.APP_ENV}"
  username              = "${var.DB_USER}"
  password              = "${var.DB_PASS}"
  parameter_group_name  = "default.mariadb10.3"
  skip_final_snapshot   = true

  # TODO:
  # deletion_protection   = "${subnet = var.APP_ENV == 'prd' ? true : false}"
  # skip_final_snapshot   = "${subnet = var.APP_ENV == 'prd' ? false : true}"

  tags = {
    app     = "ConnecHub"
    env     = "${var.APP_ENV}"
    owner   = "admin@connechub.com"
    service = "RDS"
    tech    = "MariaDB"
  }

  vpc_security_group_ids = [
    "${aws_security_group.mysql.id}",
  ]
}
