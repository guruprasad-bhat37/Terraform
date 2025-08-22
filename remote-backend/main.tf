resource "aws_s3_bucket" "terraform_state" {
  bucket = "guruprasad-terraform-backend21082025"
  # Removed deprecated "acl" argument; bucket will use default private permissions

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}


terraform {
  backend "s3" {
    bucket         = "guruprasad-terraform-backend"  # S3 bucket name
    key            = "dev/terraform.tfstate"         # Path to state file inside bucket
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
