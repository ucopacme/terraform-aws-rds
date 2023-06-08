

-->

Terraform module to provision AWS [`RDS`](https://aws.amazon.com/rds/) instances



## Introduction

The module will create:

* DB instance (MySQL)
* DB Option Group (will use the default)
* DB Parameter Group (will use the default)
* DB Subnet Group
* DB Security Group
* Random Password
* secret manager
* Customer-managed KMS key for storage encryption (optional)



## Usage
Create main.tf config file and paste/customize the following configuration.


```hcl

#


module "rds" {
  source                  = "git::https://git@github.com/ucopacme/terraform-aws-rds.git?ref=v0.0.8"
  subnet_ids              = [xxxx, xxxx]
  allocated_storage       = "50"
  max_allocated_storage   = "100" # by default it is disabled
  engine                  = "MySQL"
  identifier              = "xxx"
  secret_manager_name     = "xxxx"
  engine_version          = "8.0.32"
  instance_class          = "db.t4g.medium"
  storage_type            = "gp3"
  create_cmk              = false # by default it is false
   parameter_group_name   = "xxxxx"
  publicly_accessible     = false # by default it is false
  deletion_protection     = false # by default it is true
  apply_immediately       = true  # by dafault it is true
  backup_retention_period = "7"   # by default it is 14 days
  vpc_security_group_ids  = [xxxx]
  tags = {
    "ucop:application" = "xx"
    "ucop:createdBy"   = "Terraform"
    "ucop:environment" = "xxx"
    "ucop:group"       = "xxx"
    "ucop:source"      = "xxxx"
  }


}

## Usage
Deployment of RDS from snapshot

Create main.tf config file and paste/customize the following configuration.


```hcl

#

module "rds" {
  source                          = "git::https://git@github.com/ucopacme/terraform-aws-rds.git?ref=v0.0.8"
  subnet_ids                      = ["xxxx", "xxxxx"]
  allocated_storage               = "60"
  max_allocated_storage           = "100" # by default it is disabled
  snapshot_identifier             = "snapshot ARN"
  identifier                      = "database-1"
  secret_manager_name             = "xxx"
  # engine_version                = "8.0.32"
  instance_class                  = "db.t4g.medium"
  storage_type                    = "gp3"
  publicly_accessible             = false # by default it is false
  parameter_group_name            = "xxxx"
  deletion_protection             = false # by default it is true
  apply_immediately               = false # by dafault it is true
  backup_retention_period         = 14    # by default it is 14 days
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  vpc_security_group_ids          = [xxx]
  tags = {
    "ucop:application" = xxx
    "ucop:createdBy"   = xxx
    "ucop:environment" = xxx
    "ucop:group"       = xxx
    "ucop:source"      = xxx
  }

}
