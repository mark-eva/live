provider "aws" {
  region = "us-east-2"
}

module "mysql" {
  source = "github.com/mark-eva/modules//modules/services/data-stores/mysql?ref=v0.0.3"
  environment               = "production"
  db_password               = "LagunaMakikoy22"

   
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state-maky"
    key            = "production/data-stores/mysql/mysqldb_terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}