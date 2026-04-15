resource "aws_db_instance" "mysql" {
  depends_on     = [aws_secretsmanager_secret.mysql-secret-pwd]
  identifier     = "mysql-8-rds"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"

  db_name  = var.db_name
  username = local.db_creds.MYSQL_USER
  password = local.db_creds.MYSQL_PASSWORD

  port                = 3306
  multi_az            = false
  publicly_accessible = false

  vpc_security_group_ids = [aws_security_group.sg-rds-mysql.id]
  db_subnet_group_name   = module.vpc1.database_subnet_group

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name        = "mysql-8-rds"
    Environment = "dev"
  }
}