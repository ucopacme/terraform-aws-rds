

-->

Terraform module to provision AWS [`RDS`](https://aws.amazon.com/rds/) instances



## Introduction

The module will create:

* DB instance (MySQL, Postgres, SQL Server, Oracle)
* DB Option Group (will use the default )
* DB Parameter Group (will use the default)
* DB Subnet Group
* DB Security Group
* Randome Password
* secret manager



## Usage
Create terragrunt.hcl config file and past the following configuration.


```hcl

#
# Include all settings from root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}


dependency "sg" {
  config_path = "../sg"
}

inputs = {
  subnet_ids              = ["subnet-0ece5975ca259796e", "subnet-084c56f1fd8699660"]
  allocated_storage       = "100"
  engine                  = "MySQL"
  identifier              = "rds-instance-name"
  secret_manager_name     = "secret-manager-rds"
  engine_version          = "8.0.20"
  instance_class          = "db.t3.small"
  publicly_accessible     = true # by default it is false
  deletion_protection     = false # by default it is true
  apply_immediately       = true # by dafault it is true
  backup_retention_period = "7" * # by default it is 14 days
  vpc_security_group_ids  = [dependency.sg.outputs.sg_id]
  tags = {
    "ucop:application" = "legal"
    "ucop:createdBy"   = "Terraform"
    "ucop:enviroment"  = "Prod"
    "ucop:group"       = "CHS"
    "ucop:source"      = join("/", ["https://github.com/ucopacme/ucop-terraform-config/tree/master/terraform/its-chs-dev/us-west-2", path_relative_to_include()])
  }

}


terraform {
  source = "git::https://git@github.com/ucopacme/terraform-aws-rds.git"


}

