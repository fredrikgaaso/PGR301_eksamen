resource "aws_sqs_queue" "sqs_queue" {
  name                       = "lambda_sqs_queue_75"
  visibility_timeout_seconds = 60
  message_retention_seconds  = 1209600
  delay_seconds              = 10
  max_message_size           = 262144

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
