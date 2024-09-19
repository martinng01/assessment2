# assessment2

## Getting Started

### Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 4.16  |

Run the following commands to run this application on your local machine.

### Configure AWS CLI

Ensure that the AWS CLI is configured

```bash
aws configure
```

### Clone this repository

```bash
git clone https://github.com/martinng01/assessment2.git
cd assessment2
```

### Terraform

Initalize Terraform

```bash
terraform init
```

Create execution plan

```bash
terraform plan
```

Apply changes

```bash
terraform apply
```

## Accessing the API Gateway

After deploying with Terraform, find the API Gateway endpoint URL from the Terraform output.

Example cURL Request

```bash
curl -X GET "https://<api-id>.execute-api.<region>.amazonaws.com/assessment2/users"
```

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_archive"></a> [archive](#provider_archive) | 2.6.0   |
| <a name="provider_aws"></a> [aws](#provider_aws)             | 4.67.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                        | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_api_gateway_deployment.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment)     | resource    |
| [aws_api_gateway_integration.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration)   | resource    |
| [aws_api_gateway_method.get_users_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method)   | resource    |
| [aws_api_gateway_resource.users_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource    |
| [aws_api_gateway_rest_api.api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api)    | resource    |
| [aws_iam_role.iam_for_lambda_assessment2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)             | resource    |
| [aws_lambda_function.users_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)             | resource    |
| [aws_lambda_permission.apigw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission)                | resource    |
| [archive_file.zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file)                                 | data source |

## Inputs

No inputs.

## Outputs

| Name                                                        | Description                     |
| ----------------------------------------------------------- | ------------------------------- |
| <a name="output_base_url"></a> [base_url](#output_base_url) | The base URL of the API Gateway |
