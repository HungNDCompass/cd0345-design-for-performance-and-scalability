# TODO: Define the output variable for the lambda function.
output "arn" {
  value = aws_lambda_function.python_lambda.arn
  description = "ARN of lambda function"
}