# data
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "./terraform/lambda_s3_to_promo/source"
  output_path = "./terraform/lambda_s3_to_promo/lambda_s3_to_promo.zip"
}

data "aws_iam_policy_document" "iam_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}

# source https://www.terraform.io/docs/providers/aws/d/iam_policy.html
data "aws_iam_policy" "rds_access" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

# source https://stackoverflow.com/questions/45991897/cant-access-to-rds-from-amazon-lambda-same-vpc-and-correct-role-permissions
data "aws_iam_policy" "basic_exec" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
