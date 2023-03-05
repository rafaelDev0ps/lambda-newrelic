data "aws_lambda_function" "python-lambda" {
  function_name = "python-lambda-newrelic"
}

resource "aws_apigatewayv2_api" "http-gateway" {
  name          = var.http-api-name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "api-gateway-stage" {
  api_id = aws_apigatewayv2_api.http-gateway.id

  name        = "python-lambda-stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "http-integration-lambda" {
  api_id           = aws_apigatewayv2_api.http-gateway.id
  integration_type = "AWS_PROXY"

  connection_type        = "INTERNET"
  description            = "New Relic Python Lambda integration"
  integration_method     = "POST"
  integration_uri        = data.aws_lambda_function.python-lambda.arn
  passthrough_behavior   = "WHEN_NO_MATCH"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "api-gateway-route" {
  api_id = aws_apigatewayv2_api.http-gateway.id

  route_key = "ANY /"
  target    = "integrations/${aws_apigatewayv2_integration.http-integration-lambda.id}"
}
