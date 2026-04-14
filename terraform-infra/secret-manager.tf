# ---------------------------------------------------------
# Create a KMS key for encrypting the secret (optional)
# ---------------------------------------------------------
resource "aws_kms_key" "secret_kms" {
  description         = "KMS key for encrypting Secrets Manager secrets"
  enable_key_rotation = true
}

# ---------------------------------------------------------
# Create the secret container
# ---------------------------------------------------------
resource "aws_secretsmanager_secret" "mysql-secret-pwd" {
  name        = "mysql-app-secret-07"
  description = "Secret for my application"
  kms_key_id  = aws_kms_key.secret_kms.arn

  tags = {
    Environment = "dev"
    Owner       = "DevOps"
  }
}

# ---------------------------------------------------------
# Store the actual secret value
# ---------------------------------------------------------
resource "aws_secretsmanager_secret_version" "mysql_pwd_value" {
  secret_id = aws_secretsmanager_secret.mysql-secret-pwd.id
  secret_string = jsonencode({
    MYSQL_USER     = "mysql-admin"
    MYSQL_PASSWORD = "Pipeline11*"
  })
}