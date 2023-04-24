# create RDS db instance

resource "aws_db_instance" "this" {
  count                           = var.enabled ? 1 : 0
  allocated_storage               = var.allocated_storage
/* #   max_allocated_storage   = var.max_allocated_storage */
  backup_retention_period         = var.backup_retention_period
  deletion_protection             = var.deletion_protection
  db_subnet_group_name            = aws_db_subnet_group.this.*.id[0]
  engine                          = var.engine
  engine_version                  = var.engine_version
  identifier                      = var.identifier
  instance_class                  = var.instance_class
  multi_az                        = var.multi_az
  username                        = local.sso_secrets.username
  password                        = local.sso_secrets.password
  skip_final_snapshot             = var.skip_final_snapshot
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  storage_encrypted               = var.storage_encrypted
  storage_type                    = var.storage_type
  snapshot_identifier             = var.snapshot_identifier
  vpc_security_group_ids          = var.vpc_security_group_ids
  publicly_accessible             = var.publicly_accessible
  parameter_group_name            = var.parameter_group_name
  option_group_name               = var.option_group_name
  apply_immediately               = var.apply_immediately
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  tags                            = var.tags

  depends_on = [
    aws_db_subnet_group.this,
    aws_secretsmanager_secret.this,
    aws_secretsmanager_secret_version.this

  ]
}

# create db subnet group
resource "aws_db_subnet_group" "this" {
  count       = var.enabled ? 1 : 0
  name        = "${var.identifier}-subnet-group"
  description = "Created by terraform"
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}


#  create a random generated password which we will use in secrets.
resource "random_password" "password" {
  length           = 12
  special          = true
  min_special      = 2
  override_special = "_%"
}


# create secret and secret versions for database master account

resource "aws_secretsmanager_secret" "this" {
  name                    = var.secret_manager_name
  recovery_window_in_days = 7
  tags                    = var.tags
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = <<EOF
   {
    "username": "admin",
    "password": "${random_password.password.result}"
   }
EOF
}
