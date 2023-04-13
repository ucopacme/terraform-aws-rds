

-->

Terraform module to provision AWS [`RDS`](https://aws.amazon.com/rds/) instances



## Introduction

The module will create:

* DB instance (MySQL)
* DB Option Group (will use the default )
* DB Parameter Group (will use the default)
* DB Subnet Group
* DB Security Group
* Randome Password
* secret manager



## Usage
Create main.tf config file and past the following configuration.


```hcl

#


module "rds" {
  source                  = "git::https://git@github.com/ucopacme/terraform-aws-rds.git?ref=v0.0.5"
  subnet_ids              = [local.data_subnet_ids[0], local.data_subnet_ids[1]]
  allocated_storage       = "50"
  max_allocated_storage   = "100" # by default it is disabled
  engine                  = "MySQL"
  identifier              = "xxx"
  secret_manager_name     = "secret-manager-rds"
  engine_version          = "8.0.28"
  instance_class          = "db.m6g.large"
  publicly_accessible     = false # by default it is false
  deletion_protection     = false # by default it is true
  apply_immediately       = true  # by dafault it is true
  backup_retention_period = "7"   # by default it is 14 days
  vpc_security_group_ids  = [local.sg_id]
  tags = {
    "ucop:application" = "xx"
    "ucop:createdBy"   = "Terraform"
    "ucop:environment" = "xxx"
    "ucop:group"       = "xxx"
    "ucop:source"      = "xxxx"
  }


}
