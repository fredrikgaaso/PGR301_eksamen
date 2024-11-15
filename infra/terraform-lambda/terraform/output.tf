output "lambda_function_name" {
  value       = aws_lambda_function.lambda_function.function_name
  description = "The name of the deployed Lambda function"
}

output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_function.arn
  description = "The ARN of the deployed Lambda function"
}

output "lambda_function_invoke_url" {
  value       = aws_lambda_function.lambda_function.invoke_arn
  description = "The ARN to invoke the deployed Lambda function"
}