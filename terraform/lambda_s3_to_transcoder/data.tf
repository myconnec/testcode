# data
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "./terraform/lambda_s3_to_transcoder/lambda_source"
  output_path = "index.js.zip"
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
