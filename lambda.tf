locals {
  lambda_source_file = "${path.module}/lambda_function.py"
  lambda_zip_path    = "${path.module}/lambda_payload.zip"
}

data "archive_file" "zip" {
  type        = "zip"
  source_file = local.lambda_source_file
  output_path = local.lambda_zip_path
}

resource "aws_lambda_function" "viewcounter_lambda" {
  filename         = data.archive_file.zip.output_path
  function_name    = "govtech-assessment2-api"
  role             = aws_iam_role.iam_for_lambda_assessment2.arn
  source_code_hash = data.archive_file.zip.output_base64sha256
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.10"
}
