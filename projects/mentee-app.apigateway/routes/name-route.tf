resource "aws_apigatewayv2_route" "name-route" {
  api_id    = aws_apigatewayv2_api.mentee-app-panos.id
  route_key = "GET /echo/{name}"
}