resource "aws_lambda_function" "lambda_function" {
  function_name = "lambda_sqs_handler_75"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_sqs.lambda_handler"
  filename      = "${path.module}/ImageGeneratorWithQue/lambda_sqs.py.zip"
  timeout       = 60

  environment {
    variables = {
      MODEL_ID        = "amazon.titan-image-generator-v1"
      BUCKET_NAME     = "${var.bucket_name}"
      CANDIDATE_NUMBER = "${var.candidate_number}"
    }
  }
}

  resource "aws_lambda_event_source_mapping" "lambda_sqs_trigger" {
    event_source_arn = aws_sqs_queue.sqs_queue.arn
    function_name    = aws_lambda_function.lambda_function.arn
    batch_size       = 5
    enabled          = true
  }
