terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

resource "aws_iam_policy" "cloudwatch_policy" {
  name = "cloudwatch_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = [ aws_iam_policy.cloudwatch_policy.arn ]
}

resource "aws_lambda_function" "python_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "greet_lambda.zip"
  function_name = "my_lambda_HungND"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "greet_lambda.lambda_handler"

  runtime = "python3.10"

  environment {
    variables = {
      greeting = "HungND"
    }
  }
}
