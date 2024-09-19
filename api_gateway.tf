resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "assessment2"
  description = "API Gateway for assessment2"
}

resource "aws_api_gateway_resource" "users_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "users"
}

resource "aws_api_gateway_method" "get_users_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.users_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_method.get_users_method.resource_id
  http_method = aws_api_gateway_method.get_users_method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.users_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "deploy" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_method.get_users_method
  ]

  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  stage_name  = "assessment2"
}

output "base_url" {
  value = aws_api_gateway_deployment.deploy.invoke_url
}
