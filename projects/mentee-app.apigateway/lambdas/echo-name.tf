resource "aws_lambda_function" "mentee-app-echo" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${path.root}/echo-name.zip"
  function_name = "mentee-app-echo"
  role          = aws_iam_role.iam-for-lambda.arn
  handler       = "echo_name.lambda_handler"
  publish       = "true"
  runtime       = "ruby2.7"

}

data "archive_file" "echo-name-zip-code" {
  output_path = "${path.root}/echo-name.zip"
  source_dir  = "${path.module}/src/"
  type        = "zip"
}

resource "aws_iam_role" "iam-for-lambda" {
  name = "echo-lambda-role"

  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role.json
}

data "aws_iam_policy_document" "lambda-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# CloudWatch

resource "aws_iam_role_policy" "cloudwatch-log-group" {
  role   = aws_iam_role.iam-for-lambda.name
  name   = "cloudwatch-log-group-echo-name"
  policy = data.aws_iam_policy_document.cloudwatch-log-group.json
}

resource "aws_cloudwatch_log_group" "echo-lambda-group" {
  name = "/aws/lambda/${aws_lambda_function.mentee-app-echo.function_name}"

  retention_in_days = 3
}

data "aws_iam_policy_document" "cloudwatch-log-group" {
  statement {
    actions   = ["logs:DescribeLogStreams"]
    resources = ["${join(":", slice(split(":", aws_cloudwatch_log_group.echo-lambda-group.arn), 0, 5))}:*"]
  }

  statement {
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["${aws_cloudwatch_log_group.echo-lambda-group.arn}:*"]
  }
}