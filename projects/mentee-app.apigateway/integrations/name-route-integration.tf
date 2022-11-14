resource "aws_apigatewayv2_integration" "name-route-integration" {
  api_id           = aws_apigatewayv2_api.mentee-app-panos.id
  integration_type = "AWS_PROXY"

  connection_type      = "INTERNET"
  description          = "Lambda example"
  integration_method   = "POST"
  integration_uri      = aws_lambda_function.mentee-app-echo.invoke_arn
  passthrough_behavior = "WHEN_NO_MATCH"
}
