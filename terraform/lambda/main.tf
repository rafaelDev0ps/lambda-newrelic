data "aws_iam_role" "lambda-role" {
  name = "python-lambda-role"
}

data "aws_apigatewayv2_api" "http-gateway" {
  api_id = "87xu5w1rp0"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../../app.py"
  output_path = "../../app.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "../../app.zip"
  function_name = "python-lambda-newrelic"
  role          = data.aws_iam_role.lambda-role.arn
  handler       = "app.lambda_handler"
  layers = [
    "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39:38",
  ]
  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      tool                                   = "terraform"
      app                                    = "lambda"
      NEW_RELIC_ACCOUNT_ID                   = "3830625"
      NEW_RELIC_EXTENSION_SEND_FUNCTION_LOGS = "false"
      NEW_RELIC_LAMBDA_EXTENSION_ENABLED     = "true"
      NEW_RELIC_LAMBDA_HANDLER               = "app.lambda_handler"
    }
  }
}

resource "aws_lambda_permission" "lambda-permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${data.aws_apigatewayv2_api.http-gateway.execution_arn}/*/*"
}
