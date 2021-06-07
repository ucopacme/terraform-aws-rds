/* data "aws_secretsmanager_secret_version" "this" {
  secret_id = var.secret_id
} */

# Lets import the Secrets which got created recently and store it so that we can use later. 


data "aws_secretsmanager_secret" "this" {
  arn = aws_secretsmanager_secret.this.arn
}

data "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.arn
}
