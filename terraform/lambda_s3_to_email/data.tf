# data
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "./terraform/lambda_s3_to_email/source/pymysql"
  source_file  = "./terraform/lambda_s3_to_email/source/index.py"
  output_path = "./terraform/lambda_s3_to_email/source/media_processing_complete_email.zip"
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
