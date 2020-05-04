provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/mark-eva/modules//modules/services/webserver-cluster?ref=v0.0.2"
  cluster_name            = "stage-webserver"
  db_remote_state_bucket  = "terraform-up-and-running-state-maky"
  db_remote_state_key     = "stage/data-stores/mysql/mysqldb_terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 4

}

#Define a separate backend for web-cluster in stage environment
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-up-and-running-state-maky"
    key            = "stage/web-server-cluster/stage_ec2_instances_terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}